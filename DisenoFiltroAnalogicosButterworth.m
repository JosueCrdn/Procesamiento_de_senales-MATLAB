clc
close all

%******Diseño Filtro Analógicos Butterworth
figure(1)
FrecBP=2*pi*(70);   %Frecuencia (rad/seg) en la banda de paso
FrecBR=2*pi*(120);  %Frecuencia en la banda de rechazo
AteBP=1;    %Atenuación (db) máx. en la bp
AteBR=40;   %Atenuación mín. en la br
[N,Frecorte]=buttord(FrecBP,FrecBR,AteBP,AteBR,'s');
[B,A] = butter(N,Frecorte,'low','s'); %aqui indica que es pasa bajas
[z,p,k]=butter(N,Frecorte,'low','s');

Omega=0:10:10000;
H=freqs(B,A,Omega);
db=20*log10(abs(H));
EjeHz=Omega/(2*pi);
semilogx(EjeHz,db);
xlabel('frecuencia en rad/s');
ylabel(' magnitud en dB');
title('Filtro Butterworth Pasa Bajas ');
figure(2)
%*******************************************
%Graficación en el Plano s
%*******************************************
clear s;
N
a=0;
for sigma=-1500:10:1500;
    a=a+1;
    b=0;
    for omega=-1500:10:1500;
        b=b+1;
        s(b,a)=sigma+(1j*omega);    
    end
end

R=roots(A);
R=R';
R
Hs=B(11) ./ ((s-R(1)).*(s-R(2)).*(s-R(3)).*(s-R(4)).*(s-R(5)).*(s-R(6)).*(s-R(7)).*(s-R(8)).*(s-R(9)).*(s-R(10)));
ejesig=real(s);
ejeome=imag(s);
mesh(ejesig,ejeome,abs(Hs));
xlabel('eje real (rad/seg)');
ylabel('eje imaginario (rad/seg');
title('graficacion del plano s MAGNITUD');

%*******************************************
%Graficación de la rebanada de Fourier
%*******************************************

figure(3)
clear s;
a=0;
for sigma=-1500:10:1500;
    a=a+1;
    b=0;
    for omega=0:10:15000;
        b=b+1;
        s(b,a)=0+1j*omega;      
    end
end
R=roots(A);
R=R';
Hs=B(11) ./ ((s-R(1)).*(s-R(2)).*(s-R(3)).*(s-R(4)).*(s-R(5)).*(s-R(6)).*(s-R(7)).*(s-R(8)).*(s-R(9)).*(s-R(10)));
ejesig=real(s);
ejeome=imag(s);

mesh(ejesig,ejeome,20*log10(abs(Hs)));
xlabel('eje real (rad/seg)');
ylabel('eje imaginario (rad/seg)')
title('graficacion de rebanada de Fourier');

figure(4)
bode(B,A)


figure(5)
%z=[0 0 0 0 0 0 0 0 0 5.93e+26];
%p=[-7.44e+01 - 4.69e+02i -7.44e+01 + 4.69e+02i -2.15e+02 - 4.23e+02i
%    -2.15e+02 + 4.23e+02i -3.36e+02 - 3.36e+02i -3.36e+02 + 3.36e+02i
%    -4.69e+02 - 0.74e+02i -4.69e+02 + 0.74e+02i -4.23e+02 - 2.15e+02i  
%    -4.2388e+02 + 2.1598e+02i ];
zplane(z,p);
grid on
title('Polos y ceros');

