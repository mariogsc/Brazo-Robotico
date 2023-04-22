// Uso de potenciometro y señales analógicas
#include<Servo.h>
Servo myServo;
int const PotPin=A0;
int PotVal;
int angle;
void setup(){
myServo.attach(8);
Serial.begin(9600);
}
void loop(){
PotVal=analogRead(PotPin);
Serial.print("PotVal:");
Serial.print(PotVal);
angle=map(PotVal,0,300,0,180);
Serial.print ("angle= ");
Serial.println (angle);
myServo.write(angle);
delay (150);
}