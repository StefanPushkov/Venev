/*

MOD_BUS V 2.0


// USART initialization
// Communication Parameters: 8 Data, 1 Stop, No Parity
// USART Receiver: On
// USART Transmitter: On
// USART Mode: Asynchronous
// USART Baud Rate: 9600
UCSRA=0x00;
UCSRB=0xD8;
UCSRC=0x86;
UBRRH=0x00;
UBRRL=0x33;

*/


#ifndef RXB8
#define RXB8 1
#endif

#ifndef TXB8
#define TXB8 0
#endif

#ifndef UPE
#define UPE 2
#endif

#ifndef DOR
#define DOR 3
#endif

#ifndef FE
#define FE 4
#endif

#ifndef UDRE
#define UDRE 5
#endif

#ifndef RXC
#define RXC 7
#endif

#define FRAMING_ERROR (1<<FE)
#define PARITY_ERROR (1<<UPE)
#define DATA_OVERRUN (1<<DOR)
#define DATA_REGISTER_EMPTY (1<<UDRE)
#define RX_COMPLETE (1<<RXC)

#define RS_485 PORTA.0 

#define timer_reset TCNT0 = 0
#define timer_start TCCR0 = 0x05

unsigned char rs_timer_cloc;
unsigned char det_taym_cloc;

// USART Receiver buffer
#define RS_BUFFER_SIZE 40
char rs_buffer[RS_BUFFER_SIZE];


 
unsigned char rs_wr_index,rs_rd_index,rs_counter;

bit rs_buffer_overflow;



void rs_clear (void)
{
  
  rs_wr_index = 0;
  rs_rd_index = 0;
  rs_counter  = 0;

}

interrupt [USART_RXC] void usart_rx_isr(void)
{
char status,data;
status=UCSRA;
data=UDR;
if ((status & (FRAMING_ERROR | PARITY_ERROR | DATA_OVERRUN))==0)
   {
   rs_buffer[rs_wr_index++]=data;
#if RS_BUFFER_SIZE == 256
   // special case for receiver buffer size=256
   if (++rs_counter == 0) rs_buffer_overflow=1;
#else
   if (rs_wr_index == RS_BUFFER_SIZE) rs_wr_index=0;
   if (++rs_counter == RS_BUFFER_SIZE)
      {
      rs_counter=0;
      rs_buffer_overflow=1;
      }
#endif
   }
}




#ifndef _DEBUG_TERMINAL_IO_
// Get a character from the USART Receiver buffer
#define _ALTERNATE_GETCHAR_


#pragma used+
char getchar(void)
{
char data;
while (rs_counter==0);
data=rs_buffer[rs_rd_index++];
#if RS_BUFFER_SIZE != 256
if (rs_rd_index == RS_BUFFER_SIZE) rs_rd_index=0;
#endif
#asm("cli")
--rs_counter;
#asm("sei")
return data;
}
#pragma used-
#endif





interrupt [USART_TXC] void usart_tx_isr(void)
{
if (rs_counter)
   {
   --rs_counter;
   UDR=rs_buffer[rs_rd_index++];
#if RS_BUFFER_SIZE != 256
   if (rs_rd_index == RS_BUFFER_SIZE) rs_rd_index=0;
#endif
   }
   else{ RS_485 = 0;
         rs_clear();}
}

#ifndef _DEBUG_TERMINAL_IO_
// Write a character to the USART Transmitter buffer
#define _ALTERNATE_PUTCHAR_





#pragma used+
void putchar(char c)
{
while (rs_counter == RS_BUFFER_SIZE);
#asm("cli")
if (rs_counter || ((UCSRA & DATA_REGISTER_EMPTY)==0))
   {
   rs_buffer[rs_wr_index++]=c;
#if RS_BUFFER_SIZE != 256
   if (rs_wr_index == RS_BUFFER_SIZE) rs_wr_index=0;
#endif
   ++rs_counter;
   }
else
   UDR=c;
#asm("sei")
}
#pragma used-
#endif

#pragma used+





void timer (unsigned char argumet_timer)
{
 timer_reset;
 rs_timer_cloc = argumet_timer;
 det_taym_cloc = 0;
 timer_start; 
 
}


unsigned int CRCode(unsigned char * crc_point, unsigned char length)
{
    unsigned char j, flag;
    unsigned int  crc = 0xFFFF;
    
    while(length--)
    {
        crc ^= *crc_point++;
        for (j = 0; j < 8; j++)
        {
            flag = (unsigned char)(crc & 0x0001);
            crc >>= 1;
            if (flag > 0)
                crc ^= 0xA001;        
        }    
    }  
    return crc;
 }      
 
 
 void transmit_rs (unsigned char rs_id, unsigned char rs_func, unsigned int rs_adr, unsigned int rs_colvo,)
 {
   
 rs_buffer[0] = rs_id;
 rs_buffer[1] = rs_func;
 rs_buffer[2] = rs_adr >> 8;
 rs_buffer[3] = rs_adr ;
 rs_buffer[4] = rs_colvo >> 8;
 rs_buffer[5] = rs_colvo ;
 
// rs_buffer[7] = CRCode(rs_buffer, 6);  >> 8;
// rs_buffer[6] = CRCode(rs_buffer, 6);    
 
 rs_buffer[6]= (CRCode(rs_buffer, 6) & 0x00FF);
 rs_buffer[7]= (CRCode(rs_buffer, 6) >>8);
 
 rs_counter = 7;
 
 rs_rd_index ++;
 
 RS_485 = 1; 
 
 UDR = rs_id;  
 
 }  
 
 void transmit_rs_pac (unsigned char rs_id, unsigned char rs_func, unsigned int rs_adr, unsigned int rs_colvo, unsigned char * data_point, unsigned char data_length )
 {
 
 unsigned char i;
 
 rs_buffer[0] = rs_id;
 rs_buffer[1] = rs_func;
 rs_buffer[2] = rs_adr >> 8;
 rs_buffer[3] = rs_adr ;
 rs_buffer[4] = rs_colvo >> 8;
 rs_buffer[5] = rs_colvo ;  
 
    for(i = 0; i == data_length ;i++)
   {  
   rs_buffer[6+i] = * data_point++;
   }   
    rs_buffer[7+i] = (CRCode(rs_buffer, (6+i)) & 0x00FF); 
    rs_buffer[8+i] = (CRCode(rs_buffer, (6+i)) >> 8); 
    
    rs_counter = (10+i); 
    rs_rd_index ++; 
    UDR = rs_id;  
   // putchar(
 }

#pragma used-

#asm("sei")