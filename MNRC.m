%Método de Newton-Rapson para funções complexas MNRC
function [yy,ea,X]=MNRC(z,itmax,e)
  %x(1)=x;
  %y(1)=y;
  iterMax=itmax; %Número máximo de iterações
  erro=e;

  % Funções utilizadas para esse método
  u=@(x,y) exp(x)*cos(y)-x^2+y^2;
  v=@(x,y) exp(x)*sin(y)-2*x*y;
  ux=@(x,y) exp(x)*cos(y)-2*x;
  vx=@(x,y) exp(x)*sin(y)-2*y;
  fz=@(z) u(real(z),imag(z))+i*v(real(z),imag(z));
  dfz=@(z) ux(real(z),imag(z))+i*vx(real(z),imag(z));
  z(1)=z;
  x(1)=real(z(1));
  y(1)=imag(z(1));

  %primeiro erro
  ea(1)=abs(fz(z(1)));
  it=1;
  do
    it=it+1;
    x(it)=x(it-1)-(u(x(it-1),y(it-1))*ux(x(it-1),y(it-1))+v(x(it-1),y(it-1))*vx(x(it-1),y(it-1)))/((ux(x(it-1),y(it-1)))^2+(vx(x(it-1),y(it-1)))^2);
    y(it)=y(it-1)-(v(x(it-1),y(it-1))*ux(x(it-1),y(it-1))-u(x(it-1),y(it-1))*vx(x(it-1),y(it-1)))/((ux(x(it-1),y(it-1)))^2+(vx(x(it-1),y(it-1)))^2);
    z(it)=x(it)+i*y(it);
    ea(it)=abs(fz(z(it)));
  until ea(it) < erro || it >=iterMax
  X=1:1:(it);
  plot(X,ea,"-*");
  title('Gráfico de erros em função das iterações')
  xlabel('iteraçoes de erro')
  ylabel("Erro relativo")
  grid()
  yy=z(it);
endfunction
