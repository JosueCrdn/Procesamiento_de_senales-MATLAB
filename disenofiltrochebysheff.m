clc
close all
%******Diseño Filtro Analógicos chebysheff
figure(1)
FrecBP=2*pi*(3600);   %Frecuencia (rad/seg) en la banda de paso
FrecBR=2*pi*(1200);  %Frecuencia en la banda de rechazo
AteBP=3;    %Atenuación (db) min. en la bp
AteBR=20;   %Atenuación mín. en la br
% frecuencias de borde de la banda de paso deben estar entre 0 y 1,
%donde 1 corresponde a la frecuencia de Nyquist:
[N,Frecorte]=cheb1ord(FrecBP,FrecBR,AteBP,AteBR,'s');
[B,A] = cheby1(N,1,Frecorte,'high','s'); %aqui indica que es pasa alta
[z,p,k]=cheby1(N,1,Frecorte,'high','s');

Omega=-7000*(2*pi):10:(2*pi)*7000;
H=freqs(B,A,Omega);
db=20*log10(abs(H));
EjeHz=Omega/(2*pi);
semilogx(EjeHz,db);
xlabel('frecuencia en rad/s');
ylabel(' magnitud en dB');
title('Filtro analogico chebyschev pasa altas ');
figure(2)
% %*******************************************
% %Graficación en el Plano s
% %*******************************************
a=0;
for sigma=-2*pi*7000:500:2*pi*7000;
    a=a+1;
    b=0;
    for omega=-2*pi*7000:500:2*pi*7000;
        b=b+1;
        s(b,a)=sigma+1j*omega;
    end
end
N
R=roots(A);
R=R';
R
Hs=B(1).* s.^2 ./((s-R(1)).*(s-R(2)));
ejesig=real(s);
ejeome=imag(s);

mesh(ejesig,ejeome,abs(Hs));
%axis([-2000,2000,-2000,2000,-1,1]);
%axis([-0.01 0.01 -1 1 0 10])
xlabel('eje real (rad/seg)');
ylabel('eje imaginario (rad/seg)')
zlabel('magnitud de S');
title('Graficación en el Plano s');

figure(3)
clear s;
%*******************************************
%Graficación de la rebanada de Fourier
%*******************************************
a=0;
for sigma=-2*pi*7000:500:2*pi*7000;
    a=a+1;
    b=0;
    for omega=-2*pi*7000:500:2*pi*7000;
        b=b+1;
        s(b,a)=0+1j*omega;
                
    end
end

R=roots(A);
R=R';
Hs=B(1).* s.^2./((s-R(1)).*(s-R(2)));
ejesig=real(s);
ejeome=imag(s);
mesh(ejesig,ejeome,20*log10(abs(Hs)));
%axis([-10000 10 -10000 0 0 0.005])
xlabel('eje real (rad/seg)');
ylabel('eje imaginario (rad/seg)')
zlabel('magnitud de S');
title('Graficación de la rebanada de Fourier');

figure(4)
bode(B,A)

figure(5)
%z= [0.89 0] ;
%p= [-1.12e+04 + 1.83e+04i -1.12e+04 - 1.83e+04i];
zplane(z,p);
grid on
title('Polos y ceros');