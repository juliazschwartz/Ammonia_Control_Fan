#define RL 47  //The value of resistor RL is 47K

#define m -0.263 //Enter calculated Slope 

#define Ro 20 //Enter found Ro value
#define MQ_sensor 35 //Sensor is connected to A4


#include <WiFi.h>//Biblioteca do WiFi.
#include <WiFiUdp.h>//Biblioteca do UDP.

WiFiUDP udp;//Cria um objeto da classe UDP.
const char* ssid = "";
const char* password = "";
int rele = 15;



void setup() {
  Serial.begin(9600);
  WiFi.mode(WIFI_STA);//Define o ESP8266 como Station.
  WiFi.begin(ssid, password);
  pinMode(rele, OUTPUT);

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
    Serial.println((WiFi.localIP().toString()));
  }
 

}


void loop() {


  float leitura; //Voltage drop across the MQ sensor

  float Rs; //Sensor resistance at gas concentration 

  float ratio; //Define variable for ratio

   
if (WiFi.status() == WL_CONNECTED)//Só ira enviar dados se estiver conectado.
   {
  leitura = analogRead(MQ_sensor); //Measure the voltage drop and convert to 0-5V
  leitura= map(leitura,1000,1800,0,100);
  if(leitura>50){
    digitalWrite(rele, HIGH);
  }
  else{
    digitalWrite(rele, LOW);
  }


  float ppm = pow(10, ((log10(ratio)-1)/-0.1)); //use formula to calculate ppm

  Serial.println("NH3 (ppm) = ");
  Serial.println(leitura);
  Serial.println((WiFi.localIP().toString()));
  udp.beginPacket("192.168.118.1", 1234);//In
  udp.print(leitura);
  udp.endPacket();

   delay(200);

   }
}
