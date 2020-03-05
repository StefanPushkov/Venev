#include "stm32F10x.h"
#include "hd44780_driver\hd44780_driver.h"
#include "stm32f10x_rcc.h"

int main(void)
{
	uint8_t user_char[8]; //Сюда будем записывать пользовательский символ
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE); //Вкл порт С
	lcd_init(); //Инициализируем дисплей

	user_char[0]=0b01110; //А вот тут
	user_char[1]=0b10001; // рисуем
	user_char[2]=0b10001; // наш символ
	user_char[3]=0b10001; //
	user_char[4]=0b10001; // Это типа рыба :-)
	user_char[5]=0b01010;
	user_char[6]=0b10001;
	user_char[7]=0b10001;
	lcd_set_user_char(0, user_char); // Наша рыба это символ номер ноль

	lcd_out("This is fish"); //Выводм надпись в нулевую строку
	lcd_set_xy(0,1); //переводим курсор в первую строку
	lcd_send(0,DATA); //выводм символ номер ноль
	lcd_set_state(LCD_ENABLE, CURSOR_ENABLE, BLINK); //Включаем курсор и мигалку

	while(1)
    {

    }
}
