#include<Servo.h>  //Incluimos la libreria para manipulación de servomotores
Servo myServo; 

int const PotPin=A0;  //Definimos el pin que vamos a usar

int PotVal;  
int angle;

void setup(){
myServo.attach(8);
Serial.begin(9600);
}

void loop(){
PotVal=analogRead(PotPin);
angle=map(PotVal,112,502,0,180);
Serial.print("El valor del potenciometro es: ");Serial. println(PotVal);
Serial.print("El angulo del servo es: "); Serial.println(angle);
delay (700);

}