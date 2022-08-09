%Método dos Gradientes puros MGP()
function [yy,ferr]=MGP(x0,y0,grauPol, itmax, e);
  %Definir grau do polinômio;
  n=grauPol;

  %entrar com os coeficientes complexos ak e bk;
  %for i=1:n+1
   %fprintf("Defina o termo a[%d]:",i);
   %a(i)=input('');
   %fprintf("Defina o termo b[%d]:",i);
   %b(i)=input('');
  %endfor
   b=[0 0 0 0 0 0 0];
   a=[-2 0.5 -1 1 3 -6 1];

  err=e;

  x(1)=x0;
  y(1)=y0;
  z(1)=x0+y0*j;%valor complexo z para calculo da função.


  %Variável de iteração para cálculo dos coeficientes.
  it=1;
  do
  %Calcular as potências complexas de z=x+y.i;
  X=[1 x(it)];
  Y=[0 y(it)];%Preciso 1,2,3,....,n+1 termos

  %Variável de iteração
  for i=1:n-1
    X(i+2)=2*x(it)*X(i+1)-(x(it)^2+y(it)^2)*X(i);
    Y(i+2)=2*x(it)*Y(i+1)-(x(it)^2+y(it)^2)*Y(i);
  endfor

  %calcular o u(x,y) e v(x,y), Ux e Vx;
  u=0;
  v=0;
  ux=0;
  vx=0;
  for i=1:n+1
    u=u+a(i)*X(i)-b(i)*Y(i);
    v=v+a(i)*Y(i)+b(i)*X(i);
  endfor

  for i=2:n+1
    ux=ux+(i-1)*(a(i)*X(i-1)-b(i)*Y(i-1));
    vx=vx+(i-1)*(a(i)*Y(i-1)-b(i)*X(i-1));
  endfor

  %calculo o hk;
  hk=0.5/(ux^2+vx^2);

  %Derivadas parciais das funções.
  Fx=2*u*ux+2*v*vx;
  Fy=(-2)*u*vx+2*v*ux;

  if it>=2
     Fit(it)=u^2+v^2;
     if Fit(it)>Fit(it-1)
       dy=-hk*Fy;
       dx=-hk*Fx;
       dy=dy/2;
       dx=dx/2;
     else
       dy=-hk*Fy;
       dx=-hk*Fx;
     endif
  else
    Fit(it)=u^2+v^2;
    %variação
    dy=-hk*Fy;
    dx=-hk*Fx;
  endif


  %Novos valores da iteração
  x(it+1)=x(it)+dx;
  y(it+1)=y(it)+dy;
  z(it+1)=x(it+1)+y(it+1)*j%gerando número complexo
 %Calculando valor da função de iteração

  %mensurando os erros
  ferr=abs(f(z(it)));
  xerr=abs(x(it+1)-x(it));
  yerr=abs(y(it+1)-y(it));

  %incrementando variável de iteração
  it=it+1;
until ferr < err || it>=itmax
%Resolvendo a plotagem
X=1:1:(it-1);
plot(X,Fit,"-*");
title("Aproximação da raiz em cada iteração");
xlabel('Iteração');
ylabel("Valor da função F(x,y) na iteração");
yy=z(it);
ZY=[0];
ZY(it)=0;



endfunction
