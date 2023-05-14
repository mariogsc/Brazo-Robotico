#include <Servo.h>

int LecturasBase[10]; //Vector de lecturas.
int LecturasBrazo[10];
int AnguloBase,AnguloBrazo, i = 0, TotalBase = 0,TotalBrazo=0, PromedioBase = 0,PromedioBrazo=0;
Servo base,brazo;

void setup(){
base.attach(8);
brazo.attach(10);
Serial.begin(9600);

for(i=0; i< 10; i++) //Inicialización del vector.
LecturasBase[i] = 0;
LecturasBrazo[i]=0;
}

void loop(){
//Sustrae el total con la lectura inmediata anterior
TotalBase=TotalBase-LecturasBase[i];
TotalBrazo=TotalBrazo-LecturasBrazo[i];
//Agrega una lectura a la posición actual dentro del vector
LecturasBase[i] = analogRead(A0);
LecturasBrazo[i]=analogRead(A2);
//Realiza la sumatoria entre lecturas
TotalBase = TotalBase + LecturasBase[i];
TotalBrazo=TotalBrazo+LecturasBrazo[i];
i = i + 1;

//Calcula el promedio y envía el resultado al servomotor
if (i >= 10){
i = 0;
PromedioBase = TotalBase / 10;
AnguloBase = map(PromedioBase, 0, 1023, 0, 179);
base.write(AnguloBase);

PromedioBrazo = TotalBrazo / 10;
AnguloBrazo = map(PromedioBrazo, 0, 1023, 0, 179);
brazo.write(AnguloBrazo);


}
Serial.println(LecturasBrazo[i]);
}