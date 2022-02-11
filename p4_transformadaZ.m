clc;
clear all
close all

rho=0:0.001:2; %vector con los valores de los radios
omega=-pi:0.1:pi; %vector con los valores de frecuencia angular
z=rho'*exp(j*omega);

p1=0.5*exp(-j*pi/13);
p2=0.5*exp(-j*-pi/13);
c1=0.2*exp(-j*3*pi/7);

Hz=(z-c1)./((z-p1).*(z-p2));

%______________________________
figure(13)
%______________________________
x=real(z);
y=imag(z);
mesh(x,y,abs(Hz));
title('Grafica de la magnitud de F(z)');
xlabel('eje real'); ylabel('eje imaginario'); zlabel('magnitud de la funcion');
figure(14);
omega=0:0.1:pi;
z=1*exp(1j*omega);
%funcion de trans propuesta
Hz=(z-c1)./((z-p1).*(z-p2));

plot(omega,abs(Hz));
title('Grafica de la Fase de F(z)');
xlabel('eje imaginario');ylabel('magnitud de la funcion');

%Pasa Bajas*************************************************************************
 rho=0:0.001:2; %vector con los valores de los radios
omega=-pi:0.1:pi; %vector con los valores de frecuencia angular
z=rho'*exp(j*omega);%numero z en forma polar

%Polos y ceros de filtro pasa bajas
 p1=0.7*exp(-j*pi/18); 
 p2=0.7*exp(-j*-pi/18);
 p3=0.5*exp(-j*3*pi/18);
 p4=0.5*exp(-j*-3*pi/18); 
 c1=0.5*exp(-j*3*pi/4);
 c2=0.5*exp(-j*-3*pi/4);
 c3=0.8*exp(-j*3*pi/4);
 c4=0.8*exp(-j*-3*pi/4);
%Función de Transferencia
 Hz=(z-c1).*(z-c2).*(z-c3).*(z-c4)./((z-p1).*(z-p2).*(z-p3).*(z-p4));


%______________________________
figure(1)
%______________________________
x=real(z); %Establecer en el eje x el valor real de z
y=imag(z); %Establecer en el eje y el valor imaginario de z
mesh(x,y,abs(Hz)); %Graficar El dominio de z
title('Grafica de la magnitud de H(z) Pasa Bajas');

figure(2);
hold on
%Poner en la grafica los ceros y polos
plot(real(c1),imag(c1),'bo') 
plot(real(c2),imag(c2),'bo')
plot(real(c3),imag(c3),'bo')
plot(real(c4),imag(c4),'bo')
plot(real(p1),imag(p1),'rx')
plot(real(p2),imag(p2),'rx')
plot(real(p3),imag(p3),'rx')
plot(real(p4),imag(p4),'rx')
grid on

angulo=-pi:0.1:pi; %Establecer los angulos
r=1; %Radio unitario
circulo=r*exp(-j*angulo); %Plano z de radio unitario
plot(real(circulo),imag(circulo),'y-');
%Graficar el plano z unitario
axis([-1.5 1.5 -1.5 1.5]); %Limitar valores de los ejes
xlabel('Parte real de z'); title('Distribución de polos (x) y ceros (o) Pasa Bajas'); ylabel('Parte imaginaria de z')
hold off

figure(3);
omega=-pi:0.1:2*pi; %Establecer los angulos
z=1*exp(j*omega); %Plano z unitario

%Función de transferencia
Hz=(z-c1).*(z-c2).*(z-c3).*(z-c4)./((z-p1).*(z-p2).*(z-p3).*(z-p4));

%Graficar la magnitud de la función de transferencia respecto a los angulos
plot(omega,abs(Hz)); 
title('Grafica de la magnitud de H(z)Pasa bajas ');
axis([0 2*pi 0 120]);
%*************************************************************************
rho=0:0.001:2;
omega=-pi:0.1:pi;
z=rho'*exp(1j*omega);

p1=0.7*exp(-j*17*pi/18);
 p2=0.7*exp(-j*-17*pi/18);
 p3=0.3*exp(-j*3*pi/2);
 p4=0.3*exp(-j*-3*pi/2);
 c1=0.7*exp(-j*2*pi);
 c2=0.7*exp(-j*-19*pi/10);
 c3=0.8*exp(-j*18*pi/10);
 c4=0.8*exp(-j*-17*pi/10);

Hz=(z-c1).*(z-c2).*(z-c3).*(z-c4)./((z-p1).*(z-p2).*(z-p3).*(z-p4));
%______________________________
figure(4)
%______________________________
x=real(z);
y=imag(z);
mesh(x,y,abs(Hz));
title('Grafica de la magnitud de H(z)Pasa Altas');

figure(5);
hold on
plot(real(c1),imag(c1),'bo')
plot(real(c2),imag(c2),'bo')
plot(real(c3),imag(c3),'bo')
plot(real(c4),imag(c4),'bo')
plot(real(p1),imag(p1),'rx')
plot(real(p2),imag(p2),'rx')
plot(real(p3),imag(p3),'rx')
plot(real(p4),imag(p4),'rx')
grid on

angulo=-pi:0.1:4*pi;
r=1;
circulo=r*exp(-j*angulo);
plot(real(circulo),imag(circulo),'y-');

axis([-1.5 1.5 -1.5 1.5]);
xlabel('Parte real de z'); title('Distribución de polos (x) y ceros (o) Pasa Altas'); ylabel('Parte imaginaria de z')
hold off

figure(6);
omega=-pi:0.1:4*pi;
z=1*exp(j*omega);

Hz=(z-c1).*(z-c2).*(z-c3).*(z-c4)./((z-p1).*(z-p2).*(z-p3).*(z-p4));
plot(omega,abs(Hz));
title('Grafica de la magnitud de H(z)Filtro Pasa Altas');

%*************************************************************************
rho=0:0.001:2;
omega=0:0.1:2*pi;
z=rho'*exp(j*omega);
axis([0 2*pi 0 80]); 

p1=0.35*exp(-j*2*pi);
p2=-0.35*exp(-j*2*pi);
p3=0.1*exp(-j*2*pi);
p4=-0.1*exp(-j*2*pi);
c1=-0.69*exp(-j*2*pi);
c2=0.69*exp(-j*2*pi);
c3=-0.81*exp(-j*2*pi);
c4=0.81*exp(-j*2*pi);


Hz=(z-c1).*(z-c2).*(z-c3).*(z-c4)./((z-p1).*(z-p2).*(z-p3).*(z-p4));

%______________________________
figure(7)
%______________________________
x=real(z);
y=imag(z);
mesh(x,y,abs(Hz));
title('Grafica de la magnitud de H(z) Pasa Banda');

figure(8);
hold on
plot(real(c1),imag(c1),'bo')
plot(real(c2),imag(c2),'bo')
plot(real(c3),imag(c3),'bo')
plot(real(c4),imag(c4),'bo')
plot(real(p1),imag(p1),'rx')
plot(real(p2),imag(p2),'rx')
plot(real(p3),imag(p3),'rx')
plot(real(p4),imag(p4),'rx')
grid on

angulo=-pi:0.1:pi;
r=1;
circulo=r*exp(-j*angulo);
plot(real(circulo),imag(circulo),'y-');

axis([-1.5 1.5 -1.5 1.5]);
xlabel('Parte real de z'); title('Distribución de polos (x) y ceros (o) Pasa Banda'); ylabel('Parte imaginaria de z')
hold off

figure(9);
omega=0:0.1:4*pi;
z=1*exp(j*omega);


Hz=(z-c1).*(z-c2).*(z-c3).*(z-c4)./((z-p1).*(z-p2).*(z-p3).*(z-p4));

plot(omega,abs(Hz));
title('Grafica de la magnitud de H(z)Pasa Banda ');
axis([0 pi 0 2.5]);
%*************************************************************************
rho=0:0.001:2;
omega=-pi:0.1:pi;
z=rho'*exp(j*omega);

p1=0.5*exp(-j*2*pi);
p2=0.5*exp(-j*-2*pi/2);
p3=0.2*exp(-j*2*pi);
p4=0.2*exp(-j*-2*pi/2);
c1=0.9*exp(-j*pi/2);
c2=0.9*exp(-j*-pi/2);
c1=0.8*exp(-j*pi/2);
c2=0.8*exp(-j*-pi/2);

Hz=(z-c1).*(z-c2)./((z-p1).*(z-p2));

%______________________________
figure(10)
%______________________________
x=real(z);
y=imag(z);
mesh(x,y,abs(Hz));
title('Grafica de la magnitud de H(z) Rechaza banda');

figure(11);
hold on
plot(real(c1),imag(c1),'bo')
plot(real(c2),imag(c2),'bo')
plot(real(c3),imag(c3),'bo')
plot(real(c4),imag(c4),'bo')
plot(real(p1),imag(p1),'rx')
plot(real(p2),imag(p2),'rx')
plot(real(p3),imag(p3),'rx')
plot(real(p4),imag(p4),'rx')
grid on

angulo=-pi:0.1:pi;
r=1;
circulo=r*exp(-j*angulo);
plot(real(circulo),imag(circulo),'y-');

axis([-1.5 1.5 -1.5 1.5]);
xlabel('Parte real de z'); title('Distribución de polos (x) y ceros (o) Rechaza Banda'); ylabel('Parte imaginaria de z')
hold off

figure(12);
omega=0:0.1:4*pi;
z=1*exp(j*omega);


Hz=(z-c1).*(z-c2)./((z-p1).*(z-p2));

plot(omega,abs(Hz));
title('Grafica de la magnitud de H(z)Filtro Rechaza Banda');
axis([0 pi 0 3.5]);
