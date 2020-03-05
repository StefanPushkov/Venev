#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

int main()
{
while(1)
{

}
GPIO_InitTypeDef port;
RCC_AHB1PeriphClockCmd(RCC_AHB1PeriphGPIOD, ENABLE);


GPIOStructInit(&port);

port.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15
port.GPIO_Mode = GPIO_Mode_OUT
port.GPIO_Speed	= GPIO_Speed_2MHz;
port.GPIO_OType	= GPIO_OType_PP;
GPIO_Init(GPIOD, &port);

}