/*

 * Program to measure gas in ppm using MQ sensor

 * Program by: B.Aswinth Raj

 * Website: www.circuitdigest.com

 * Dated: 28-12-2017

 */

#define RL 47  //The value of resistor RL is 47K

#define m -0.263 //Enter calculated Slope 

// #define b 0.42 //Enter calculated intercept

#define Ro 20 //Enter found Ro value

// #define MQ_sensor 4 //Sensor is connected to A4
#define MQ_sensor 35 //Sensor is connected to A4


#include <WiFi.h>//Biblioteca do WiFi.
#include <WiFiUdp.h>//Biblioteca do UDP.

WiFiUDP udp;//Cria um objeto da classe UDP.
// long x;//Variavel para ser enviada.
const char* ssid = "Redmi 10A";
// const char* ssid = "Gran - Alunos";
// const char* password = "granalunos";
const char* password = "12345678";
int rele = 15;

// #include <LiquidCrystal.h> //Header file for LCD from https://www.arduino.cc/en/Reference/LiquidCrystal


// const int rs = 8, en = 9, d4 = 10, d5 = 11, d6 = 12, d7 = 13; //Pins to which LCD is connected

// LiquidCrystal lcd(rs, en, d4, d5, d6, d7);


void setup() {
  Serial.begin(9600);
  WiFi.mode(WIFI_STA);//Define o ESP8266 como Station.
  // Serial.begin(115200);
  //  Serial.begin(9600);
  WiFi.begin(ssid, password);
  pinMode(rele, OUTPUT);

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
    Serial.println((WiFi.localIP().toString()));
  }
  // lcd.begin(16, 2); //We are using a 16*2 LCD display

  // lcd.print("NH3 in PPM"); //Display a intro message

  // lcd.setCursor(0, 1);   // set the cursor to column 0, line 1

  // lcd.print("-CircuitDigest"); //Display a intro message 


  //  delay(2000); //Wait for display to show info

  //  lcd.clear(); //Then clean it

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
  // leitura = analogRead(MQ_sensor)*(5.0/1023.0); //Measure the voltage drop and convert to 0-5V
  // leitura = analogRead(MQ_sensor)*(3.3/4096.0); //Measure the voltage drop and convert to 0-5V

  // Rs = ((3.3*RL)/leitura)-RL; //Use formula to get Rs value

  // ratio = Rs/Ro;  // find ratio Rs/Ro

 

  float ppm = pow(10, ((log10(ratio)-1)/-0.1)); //use formula to calculate ppm
  // float ppm = pow(10, ((log10(ratio)-0.42)/m)); //use formula to calculate ppm


  // lcd.print("NH3 (ppm) = "); //Display a ammonia in ppm

  // lcd.print(ppm);

  // lcd.setCursor(0, 1);   // set the cursor to column 0, line 1

  // lcd.print("Voltage = "); //Display a intro message 

  // lcd.print(VRL);
  Serial.println("NH3 (ppm) = ");
  Serial.println(leitura);
  Serial.println((WiFi.localIP().toString()));
  udp.beginPacket("192.168.118.1", 1234);//In
  udp.print(leitura);
  udp.endPacket();

   delay(200);

   }

  //  lcd.clear(); //Then clean it

}