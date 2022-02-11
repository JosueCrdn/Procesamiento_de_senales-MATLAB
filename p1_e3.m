%Utilizando polimonios f(x) y g(x), calcular
%la derivada de f(x)
%Evaluar el polinomio f(x)en 3
%Evaluar f(2)*g(2)

syms x
f=x^3+3*x^2+8*x+2;          %Polinomio f
g=-3*x^3+8*x^2-2*x+10;      %Polinomio g

f1=[1 3 8 2];               %Coeficientes del polinomio f
g1=[-3 8 -2 10];            %Coeficientes del polinomio g

fder=polyder(f1)            %Derivada del polinomio f(x)
fval=polyval(f1,3)          %Evaluar el polinomio f(3)
fgval=polyval(f1,2)*polyval(g1,2) %Evaluar f(2)*g(2)