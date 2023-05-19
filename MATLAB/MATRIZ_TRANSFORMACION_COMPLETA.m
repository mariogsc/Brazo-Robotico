% Obtención de la matriz Cinemática a partir de los parámetros DH
close all;
clear;
clc;

% Definimos las variables a utilizar
syms L1 L2 L3 L4 q1 q2 q3 q4 q5 

% Escribimos las matrices de transformacion obtenidas de la tabla DH
A = [sym(cos (q1)),0,sym(sin (q1)),0;
     sym(sin (q1)),0,sym(-cos (q1)),0;
     0,1,0,sym(L1);
     0,0,0,1]

B = [sym(cos (q2)),sym(-sin (q2)),0,0;
     sym(sin (q2)),sym(cos (q2)),0,0;
     0,0,1,sym(L2);
     0,0,0,1]

C = [sym(cos (q3)),sym(-sin (q3)),0,0;
     sym(sin (q3)),sym(cos (q3)),0,0;
     0,0,1,sym(L3);
     0,0,0,1]

D = [sym(-sin (q4)),0,sym(cos (q4)),0;
     sym(cos (q4)),0,sym(sin (q4)),0;
     0,1,0,0;
     0,0,0,1]

E = [sym(cos (q5)),sym(-sin (q5)),0,0;
     sym(sin (q5)),sym(cos (q5)),0,0;
     0,0,1,sym(L4);
     0,0,0,1]

T = A * B * C * D * E;
T = simplify (T); % Simplifica a su mínima expresión la matriz T
display (T); % Muestra el resultado

%Matrliz traslacion:
P = [sym(L2*sin(q1) + L3*sin(q1) + L4*cos(q1)*cos(q2 + q3 + q4)), sym(L4*sin(q1)*cos(q2 + q3 + q4) - L3*cos(q1) - L2*cos(q1)), sym(L1 + L4*sin(q2 + q3 + q4))]
%Matriz variables traslacion:
G = [q1; q2; q3; q4; q5]

%Jacobiana de traslacion:
Jp = jacobian(P, G);
Jp = simplify (Jp); 
display (Jp);


%Matriz de rotación:
R = [  sin(q1)*sin(q5) - sin(q2 + q3 + q4)*cos(q1)*cos(q5),          cos(q5)*sin(q1) + sin(q2 + q3 + q4)*cos(q1)*sin(q5),        cos(q2 + q3 + q4)*cos(q1);
     - cos(q1)*sin(q5) - sin(q2 + q3 + q4)*cos(q5)*sin(q1),          sin(q2 + q3 + q4)*sin(q1)*sin(q5) - cos(q1)*cos(q5),        cos(q2 + q3 + q4)*sin(q1);
                                 cos(q2 + q3 + q4)*cos(q5),                                   -cos(q2 + q3 + q4)*sin(q5),                sin(q2 + q3 + q4)]

%Derivada respecto de q1:
Rq1= diff(R,q1);
Rq1 = simplify (Rq1); 
display (Rq1);

%Derivada respecto de q2:
Rq2= diff(R,q2);
Rq2 = simplify (Rq2); 
display (Rq2);

%Derivada respecto de q3:
Rq3= diff(R,q3);
Rq3 = simplify (Rq3); 
display (Rq3);

%Derivada respecto de q4:
Rq4= diff(R,q4);
Rq4 = simplify (Rq4); 
display (Rq4);

%Derivada respecto de q5:
Rq5= diff(R,q5);
Rq5 = simplify (Rq5); 
display (Rq5);

%Matriz Traspuesta:
Rt= transpose(R);
display(Rt);

%SIGUIENTE PASO:
%q1
R1=Rq1*Rt;
R1=simplify(R1);
display(R1);

%q2
R2=Rq2*Rt;
R2=simplify(R2);
display(R2);

%q3
R3=Rq3*Rt;
R3=simplify(R3);
display(R3);

%q4
R4=Rq4*Rt;
R4=simplify(R4);
display(R4);

%q5
R5=Rq5*Rt;
R5=simplify(R5);
display(R5);

