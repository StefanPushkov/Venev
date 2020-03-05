#include "stm32f10x.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h" 

int main()
{
GPIO_InitTypeDef  GPIO_Structure;

RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);

GPIO_Structure.GPIO_Pin   = GPIO_Pin_8;
GPIO_Structure.GPIO_Mode  = GPIO_Mode_Out_PP;
GPIO_Structure.GPIO_Speed = GPIO_Speed_2MHz;
GPIO_Init(GPIOC, &GPIO_Structure); 

GPIO_SetBits(GPIOC, GPIO_Pin_8);

while(1)
{
}

}
