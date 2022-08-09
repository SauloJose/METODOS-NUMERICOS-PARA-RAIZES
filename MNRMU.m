%Método de Newton-Rapson para raizes múltiplas MNRM
function [yy,ea,X]=MNRMU(x0,itmax,err)
  x(1)=x0; %inicializo o vetor
  erro=err; %constante de erro
  iterMax=itmax; %Número máximo de iterações
  % Funções utilizadas para esse método
  g=@(x) f(x);
  dg=@(x) sin(2*x)-sin(x)-x*cos(x)+x/2;
  ddg=@(x) 2*cos(2*x)-2*cos(x)+x*sin(x)+1/2;
  it=1;
  do
    it=it+1;
    x(it)=x(it-1)-(g(x(it-1))*dg(x(it-1)))/((dg(x(it-1)))^2-g(x(it-1))*ddg(x(it-1)));
    ea(it-1)=abs((x(it)-x(it-1))/x(it));
  until ea(it-1) < erro || it >=iterMax
  X=1:1:(it-1);
  Y=1:1:(it);
  subplot(2,1,1);
  plot(Y,x,"-*");
  title("Aproximação da raiz em cada iteração");
  xlabel('iteraçoes -1')
  ylabel("Valor da iteração")
  grid()
  subplot(2,1,2);
  plot(X,ea,"-*");
  title('Gráfico de erros em função das iterações')
  xlabel('iteraçoes de erro')
  ylabel("Erro relativo")
  grid()
  yy=x(it);
endfunction
