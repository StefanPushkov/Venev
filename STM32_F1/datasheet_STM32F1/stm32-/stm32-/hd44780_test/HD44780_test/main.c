#include "stm32F10x.h"
#include "hd44780_driver\hd44780_driver.h"
#include "stm32f10x_rcc.h"

int main(void)
{
	uint8_t user_char[8]; //���� ����� ���������� ���������������� ������
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE); //��� ���� �
	lcd_init(); //�������������� �������

	user_char[0]=0b01110; //� ��� ���
	user_char[1]=0b10001; // ������
	user_char[2]=0b10001; // ��� ������
	user_char[3]=0b10001; //
	user_char[4]=0b10001; // ��� ���� ���� :-)
	user_char[5]=0b01010;
	user_char[6]=0b10001;
	user_char[7]=0b10001;
	lcd_set_user_char(0, user_char); // ���� ���� ��� ������ ����� ����

	lcd_out("This is fish"); //������ ������� � ������� ������
	lcd_set_xy(0,1); //��������� ������ � ������ ������
	lcd_send(0,DATA); //������ ������ ����� ����
	lcd_set_state(LCD_ENABLE, CURSOR_ENABLE, BLINK); //�������� ������ � �������

	while(1)
    {

    }
}
