clc;
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)

Fsenal=100; %frecuencia de la señal,
Tsenal=1/Fsenal; %donde veremos un 11.1miis
LonSenal=Tsenal*6; %6 ciclos de la señal

t=0:0.0001:LonSenal; %vector y tener 1000 puntos 
x=sin(2*pi*Fsenal*t);
subplot(1,2,1); plot(t,x,'m'); axis([0, LonSenal, -1.5, 1.5]);
xlabel('tiempo en s'); title('señal senoidal con frec 100Hz'); ylabel('Magnitud')

Fm=220;%frecuencia de muestreo
Tm=1/Fm; %tiempo de muestro los pasos que da 5milis
td=0:Tm:LonSenal;%tiempo de muestreo 
xd=sin(2*pi*Fsenal*td);
hold on; subplot(1,2,1); stem(td,xd,'ob'); hold off;
xlabel('tiempo en s'); title('señal senoidal muestrada a 220 muestras/seg'); ylabel('Magnitud')

Lon_n=length(xd);
n=1:1:Lon_n;
subplot(1,2,2); stem(n,xd,'k'); axis([0, Lon_n, -1.5, 1.5]);

%algoritmo para calcular la transformada de fourier en tiempo discreto
deltaw = 0.01; %incrementos de w o frec
w=0:deltaw:2*pi;                           
matriz=zeros; 
for col=1:1:length(w)
    for fil=1:1:length(xd)
        matriz(fil,col) = exp(-j*n(fil)*w(col));
    end
end

X = xd*matriz; % señal de muestrea por la matriz generada
magX = abs(X); %magnitud de la señal  
FasX = angle(X); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
ejeHz =(Fm/2)*w/pi;
subplot(2,1,1);
plot(ejeHz,magX,'r'); grid on 
xlabel('frecuencia en Hz'); title('Magnitud'); ylabel('Magnitud');axis([0, 230, -0.5, 6.5]);

subplot(2,1,2)
plot(ejeHz,FasX,'b'); grid on 
xlabel('frecuencia en Hz'); title('Fase'); ylabel('Fase');axis([0, 230, -3.3, 3.3]);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)


Fmsob=500; %frecuencia sobre muestreada 
Tmsob=1/Fmsob;
tds=0:Tmsob:LonSenal;
xdsob=sin(2*pi*Fsenal*tds); %vector para la grafica sobremuestreada 
X2=fft(xdsob,length(w)); %transformada de la señal seno 
magX2=abs(X2); %grafica magnitud 
ejeHzs=(Fmsob/2)*w/pi;
subplot (3,1,1);
plot(ejeHzs,magX2,'c'); grid on
xlabel('frecuencia en Hz'); title('Magnitud cuando es sobremuestreada'); ylabel('Magnitud')

Fmo=220;
Tm=1/Fmo; %tiempo de muestro ls pasos que da 5milis
to=0:Tm:LonSenal;
xo=sin(2*pi*Fsenal*to);
X0=fft(xo,length(w));
magX0=abs(X0); %grafica magnitud 
ejeHz=(Fmo/2)*w/pi;
subplot (3,1,2);
plot(ejeHz,magX0,'g'); grid on
xlabel('frecuencia en Hz'); title('Magnitud con muestra original'); ylabel('Magnitud')




Fmsub=150;
Tm=1/Fmsub; %tiempo de muestro ls pasos que da 5milis
td=0:Tm:LonSenal;
xdsub=sin(2*pi*Fsenal*td);
X1=fft(xdsub,length(w));
magX1=abs(X1); %grafica magnitud 
ejeHz=(Fmsub/2)*w/pi;
subplot (3,1,3);
plot(ejeHz,magX1,'r'); grid on
xlabel('frecuencia en Hz'); title('Magnitud cuando es submuestreada'); ylabel('Magnitud')

