% Mi primer programa ¡Hola Mundo!
 clear all  %limpi variables
 clc        %limpia la venta de comandos 
 close all  %cierra las figuras
  fm=1000;  %frecuencia de muestro (muestras/segundo)
  tm=1/fm;  %periodo de muestreo(segundos/muestra)
  n=0:tm:3;  %se genera vectpr de timpo discreto dado en segundos
  f=5;
  fi=0;
  v=sin(2*pi*f*(-1*n));
    subplot(3,2,3)
  plot (n,v,'b');
  xlabel('timpo');
  ylabel('voltaje');
  title('señal uso');
  
 % figure(2)
  tao=-100e-3;
  I=3*exp(n/tao);
  subplot(3,2,5)
  plot (n,I,'g');
  