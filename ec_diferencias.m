clear all
close all

figure(1)

a=-1;
x=[0 0 0 0 0 0 0 0 0  1 0 0 0 0 0 0 0 0 0 0];
y=[0 0 0 0 0 0 0 0 a  0 0 0 0 0 0 0 0 0 0 0];


for n=10:1:14;
    y(n)=1.2*x(n)+0.7*y(n-1);
end

for n=9:-1:7;
    y(n-1)= -1*(1.2*x(n)-y(n))/0.7;
end

k=-9:1:10;
stem(k,y);
xlabel('eje x'); title('señal ecuacion de diferencias'); ylabel('Magnitud y[n]')


