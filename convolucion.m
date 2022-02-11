figure(1)
n=0:1:6;
x=heaviside(n+0.0001) - heaviside(n+0.001-5);
h=exp(n/8).* (heaviside(n+0.0001)-heaviside(n+0.001-7));
y=conv(h,x);
vectorX=0:length(y)-1;
stem(vectorX,y);
xlabel('tiempo en s'); title('señal de convolucion con Matlab'); ylabel('Magnitud')
hold on
figure(2)
lx=length(x); %numero de muestras
lh=length(h);
h=[zeros(1,14) h zeros(1,15)];
x=[zeros(1,14) x zeros(1,15)];
y2= [zeros(1,40)]; %espacio requerido para guardar la convolucion

subplot(3,1,1)
stem(x)
xlabel('tiempo en s'); title('señal X'); ylabel('Magnitud')
subplot(3,1,2)
stem(h)
xlabel('tiempo en s'); title('señal H'); ylabel('Magnitud')

for n=1:1:lx+lh-1
    temp=0;
    for k=1:1:(lx)
    p=x(k+14)*h(n-k+15);
    temp=p+temp;
    end
     
  y2(n+15)=temp;
end

subplot(3,1,3)
n1=0:1:length(y2)-1;
stem(n1,y2);
xlabel('tiempo en s'); title('señal con producto interno'); ylabel('Magnitud')
    