%Señal senoidal
x=(0:pi/100:4*pi);
y=sin(x);
subplot(3,3,1);
plot(x,y,'-b')
axis([0,4*pi,-1.5,1.5]);
xlabel('tiempo');
ylabel('magnitud');
grid on;
title('Senoidal');
 
%Señal cuadrada
t=0:1/1000:2*pi;
y = square(2*t);
subplot(3,3,2);
plot(t,y,'r');
axis([0,4,-2,2]);
xlabel('tiempo');
ylabel('magnitud');
grid on;
title('Cuadrada');
 
%Señal exponencial
x=(0:pi/100:2*pi);
y=exp(x);
subplot(3,3,3);
plot(x,y,'g')
axis([0,7,0,600]);
xlabel('tiempo');
ylabel('magnitud');
grid on;
title('Exponencial');
 
%Pulso
x=[-1:0.01:9];
y=rectpuls(x);
subplot(3,3,4);
plot(x,y,'k')
axis([-2,10,-1.3,1.3]);
xlabel('tiempo');
ylabel('magnitud');
grid on;
title('Pulso');
 
%Señal triangular
t=0:1/10000:0.1;
f=60;
x1=sawtooth(2*pi*f*t); 
subplot(3,3,5);
plot(t,x1,'c');
axis([-0.01,0.1,-1.3,1.3]);
xlabel('tiempo');
ylabel('magnitud');
grid on;
title('Triangular');

%operaciones con vectores
 %A=rand(6) crear vectores con numeros random
 %B=rand(5,3)

A=[1 5 1 2];
B=[1 3 7 7];
suma= A+B;
RESTA=A-B;
MULTIPLICACION=A*B';
DIVISICION=A/B;
%operaciones con MATRICES
A=[1 5 1 2; 2 9 10 4];
B=[1 3 7 7; 1:4];
SUMAM= A+B;
RESTAM=A-B;
MULTIPLICACIONM=A*B';
DIVISICIONM=A/B;
%operacion numeros complejos
Num1= 15+12i;
Num2= 13+77i;
SumaC=Num1+Num2
RestaC=Num1-Num2
MultiplicacionC=Num1*Num2
divisionC=Num1/Num2