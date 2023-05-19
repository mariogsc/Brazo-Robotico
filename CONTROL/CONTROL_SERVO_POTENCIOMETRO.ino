// Uso de potenciometro y señales analógicas
#include<Servo.h>
Servo myServo;
int const PotPin=A0;
int PotVal;

void setup(){

Serial.begin(9600);
}
void loop(){
PotVal=analogRead(PotPin);
Serial.print("El Valor del potenciometro es: ");
Serial.print(PotVal);
delay (150);
}
