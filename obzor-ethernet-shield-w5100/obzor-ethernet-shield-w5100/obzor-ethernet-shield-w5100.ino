/* 
Тестировалось на Arduino IDE 1.8.5
Дата тестирования 29.11.2018г.
*/

#include <SPI.h>                                   // Подключаем библиотеку SPI
#include <Ethernet.h>                              // Подключаем библиотеку Ethernet

byte mac[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED}; // Вводим MAC адрес 
IPAddress ip(192, 168, 21, 105);                   // Указываем станитеский IP 

EthernetServer server(80);                         // Инифиализация библиотеки Ethernet "server" на порту 80 

void setup() 
{
  Serial.begin(9600);                              // Задаем скорость передачи данных
  while (!Serial) {;}

  Ethernet.begin(mac, ip);                         // Запускаем сервер  
  server.begin();
  Serial.print("server is at ");
  Serial.println(Ethernet.localIP());
}

void loop() 
{
  EthernetClient client = server.available();     // Принимаем данные, посылаемые клиентом 
  if (client) {
    Serial.println("new client");
    boolean currentLineIsBlank = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        Serial.write(c);
        if (c == '\n' && currentLineIsBlank) {
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println("Connection: close");  // the connection will be closed after completion of the response
          client.println("Refresh: 5");  // refresh the page automatically every 5 sec
          client.println();
          client.println("<!DOCTYPE HTML>");
          client.println("<html>");
          for (int analogChannel = 0; analogChannel < 6; analogChannel++) {
            int sensorReading = analogRead(analogChannel);
            client.print("analog input ");
            client.print(analogChannel);
            client.print(" is ");
            client.print(sensorReading);
            client.println("<br />");
          }
          client.println("</html>");
          break;
        }
        if (c == '\n') {
          currentLineIsBlank = true;
        } else if (c != '\r') {
          currentLineIsBlank = false;
        }
      }
    }
    delay(1);
    client.stop();
    Serial.println("client disconnected");
  }
}

