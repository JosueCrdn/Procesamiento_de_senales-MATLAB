%ventana de subgr�ficos para mostrar la funci�n seno, coseno, tangente,una se�al de ruido
x=linspace(0,2*pi,30);
%se�al seno
    y1=sin(x);
    subplot(2,2,1)
    plot(x,y1,'b')
    axis([0 6.5 -1.3 1.3])
    title('Seno')
    xlabel('Tiempo')
    ylabel('Amplitud')
    grid on
 %se�al coseno
    subplot(2,2,2)
    y2=cos(x);
    plot(x,y2,'r')
    axis([0 6.5 -1.3 1.3])
    title('Coseno')
    xlabel('Tiempo')
    ylabel('Amplitud')
    grid on
    %se�al tangente
    subplot(2,2,3)
    y3=tan(x);
    plot(x,y3,'c')
    axis([0 6.5 -1.5 1.5])
    title('Tangente')
    xlabel('Tiempo')
    ylabel('Amplitud')
    grid on
    
    
%se�al de ruido 
A=zeros (30);
    for c=1:30
        A(c)=c;
    end
    subplot(2,2,4)
    y=rand(1,30);
    plot(A,y,'k')
    title('Ruido')
    xlabel('Tiempo')
    ylabel('Voltaje')
    grid on