%MÉTODO DE NEWTON-RAPSON

function [yy,ea,Xa]=MNR(x0,itmax,e)
  f=@(x) x^2-7*x+12;
  df=@(x) 2*x-7;

  err=e;
  x(1) = x0;
  it=1
  do
    it=it+1;
    x(it)=x(it-1)-f(x(it-1))/df(x(it-1));
    ea(it-1)=abs((x(it)-x(it-1))/x(it));
  until abs(f(x(it))) < e || it>=itmax
  Xa=1:1:it-1;
  plot(Xa,ea,"-o");
  title('Gráfico dos erros em função das iterações');
  xlabel('iteração');
  ylabel('Erro relativo');
  grid();
  yy=x(it);




