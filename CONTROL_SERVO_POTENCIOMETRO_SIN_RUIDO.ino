#include <Servo.h>

const int PIN = 8;
int Lecturas[10]; //Vector de lecturas.
int Val, i = 0, Total = 0, Promedio = 0;
Servo MiServo;

void setup(){
MiServo.attach(PIN);
Serial.begin(9600);

for(i=0; i< 10; i++) //Inicialización del vector a 0
Lecturas[i] = 0;

i=0;
}

void loop(){
Total = Total - Lecturas[i]; //Obtiene la diferencia con la lectura anterior
Lecturas[i] = analogRead(A0); //Agrega una lectura a la posición actual dentro del vector
Total = Total + Lecturas[i]; //Realiza la sumatoria entre lecturas
i = i + 1;

if (i >= 10){ //Calcula el promedio y envía el resultado al servomotor
i = 0;
Promedio = Total / 10;
Val = map(Promedio, 0, 300, 0, 179);
MiServo.write(Val);
Serial.println(Val, DEC);
delay(200);
}
}