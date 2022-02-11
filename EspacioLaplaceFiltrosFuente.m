clc
close all
clear all

a=0;
for sigma=-50:0.5:50;
    a=a+1;
    b=0;
    for omega=-50:0.5:50;
        b=b+1;
        s(b,a)=sigma+1j*omega;    
    end
end
R=1;  %mover entre 1 y 0.2 para no salir de rango
C=0.05;  
L=1;

figure(1)
%filtro notch 
   H=( s.^2+1/(L*C) ) ./( s.^2+s/(R*C)+1/(L*C) ); %r=1,c0.5 L0.025
%filtro pasabanda
% H=( s/(R*C) ) ./ ( s.^2+s/(R*C)+1/(L*C) ); %1, 0.5 , 1 
%filtro pasabajas
%  H=( 1/(L*C) ) ./ ( s.^2+s/(R*C)+1/(L*C) ); %L=0.3,c=0.5,r=0.3
%filtro pasaaltas
%H=( s.^2 ) ./ ( s.^2+s/(R*C)+1/(L*C) ); %r=0.3 c0.3 L0.3

ejesig=real(s);
ejeome=imag(s);
%mesh(ejesig,ejeome,abs(H));
mesh(ejesig,ejeome,20*log10(abs(H)));
axis([-30 30 -30 30 -30 30])
%  title('filtro rechazo-banda')
title('filtro pasa-banda')
% title('filtro pasa-bajas')
% title('filtro pasa-altas')
xlabel('eje real');
ylabel('eje imaginario')
zlabel('magnitud de s')

figure(2)
%cuando sigma es cero en TFC
a=0;
for sigma=-50:0.5:50;
    a=a+1;
    b=0;
    for omega=-50:0.5:50;
        b=b+1;
        sigma=0;
        s(b,a)=0+1j*omega;               
    end
end
%filtro notch o rechaza banda
  H=( s.^2+1/(L*C) ) ./( s.^2+s/(R*C)+1/(L*C) );
%filtro pasabanda

% H=( s/(R*C) ) ./ ( s.^2+s/(R*C)+1/(L*C) );
%filtro pasabajas
% H=( 1/(L*C) ) ./ ( s.^2+s/(R*C)+1/(L*C) );
%filtro pasaaltas
%  H=( s.^2 ) ./ ( s.^2+s/(R*C)+1/(L*C) );
ejesig=real(s);
ejeome=imag(s);
%mesh(ejesig,ejeome,abs(H));
mesh(ejesig,ejeome,20*log10(abs(H)));
axis([-10 10 -10 10 -10 10])
title('filtro rechazo-banda rebanada')
% title('filtro pasa-banda')
% title('filtro pasa-bajas')
% title('filtro pasa-altas')
xlabel('eje real');
ylabel('eje imaginario')
zlabel('magnitud de s')

figure(3)
a=1;
    for omega=-50:0.5:50;
        w(a)=1j*omega;
             a=a+1;
    end
    
%FILTRORECHAZO DE BANDA
 RF=( w.^2+1/(L*C) ) ./( w.^2+w/(R*C)+1/(L*C) );
%filtro pasabanda
% RF=( w/(R*C) ) ./ ( w.^2+w/(R*C)+1/(L*C) );
%filtro pasabajas
% RF=( 1/(L*C) ) ./ ( w.^2+w/(R*C)+1/(L*C) );
%filtro pasaaltas
%  RF=( w.^2 ) ./ ( w.^2+w/(R*C)+1/(L*C) );

 title('filtro rechazo-banda')
%  title('filtro pasa-banda')
% title('filtro pasa-bajas')
%  title('filtro pasa-altas')

 ejeome=imag(w);
plot(ejeome,abs(RF),'r');
%bode(ejeome,abs(RF));
hold on
%###########cambio de capacitor ### para hacer dicho cambio

C=1;
%RECHAZO DE BANDA
 RF=( w.^2+1/(L*C) ) ./( w.^2+w/(R*C)+1/(L*C) );
%filtro pasabanda
%  RF=( w/(R*C) ) ./ ( w.^2+w/(R*C)+1/(L*C) );
%filtro pasabajas
%  RF=( 1/(L*C) ) ./ ( w.^2+w/(R*C)+1/(L*C) );
%filtro pasaaltas
%  RF=( w.^2 ) ./ ( w.^2+w/(R*C)+1/(L*C) );

ejeome=imag(w);
plot(ejeome,abs(RF),'g');
%bode(ejeome,abs(RF),'g');

xlabel('eje real');
ylabel('eje imaginario')
legend('c=0.5', 'c=1')
 title('filtro rechazo-banda')
% title('filtro pasa-banda')
%  title('filtro pasa-bajas')
%   title('filtro pasa-altas')


