/****************************gpio.c*********************************/
//Подключаем все нужные файлы
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
/*******************************************************************/






//Тут будет вся инициализация всей использующейся периферии
void initAll()
{	GPIO_InitTypeDef port;
    
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
    //RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
    //RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
    //RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);

	GPIO_StructInit(&port);

    port.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14	| GPIO_Pin_15;
    port.GPIO_Mode = GPIO_Mode_OUT;
    port.GPIO_Speed = GPIO_Speed_2MHz;
	port.GPIO_OType = GPIO_OType_PP;
    GPIO_Init(GPIOD, &port);
  
	
    port.GPIO_Pin = GPIO_Pin_0;         
    port.GPIO_Mode = GPIO_Mode_IN;
	port.GPIO_Speed = GPIO_Speed_2MHz;   
	//port.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_Init(GPIOA, &port);
	

   
   
}
/*******************************************************************/
int main() 
{	uint8_t buttonState = 0;
//    uint16_t  data = 0;
  	initAll();
    //Объявляем переменную для хранения состояния кнопки  
         
      
    while(1)   
    {   
	   	  GPIOD->ODR = 0x0000;
		 // data = GPIOA->IDR;
		 // GPIOD->ODR = data;

	 
        //С помощью функции из SPL считываем из внешнего мира      
        //состояние кнопки       
        buttonState = GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_0); 
		
		 
        if (buttonState == 0) 
        {   
            GPIO_SetBits(GPIOD, GPIO_Pin_12);
			GPIO_SetBits(GPIOD, GPIO_Pin_13);
			GPIO_SetBits(GPIOD, GPIO_Pin_14);
			GPIO_SetBits(GPIOD, GPIO_Pin_15);
        }   
        else    
        {      
            GPIO_ResetBits(GPIOD, GPIO_Pin_12);
			GPIO_ResetBits(GPIOD, GPIO_Pin_13);
			GPIO_ResetBits(GPIOD, GPIO_Pin_14);
			GPIO_ResetBits(GPIOD, GPIO_Pin_15);

        }	  
     
   } 
  
  
  
  
  
   }




/****************************End of file****************************/


