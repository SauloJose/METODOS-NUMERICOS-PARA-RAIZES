 %Método da secante MSC()
 function [yy,ea,X]=MSC(x0,x1,itmax,e)
  xu=x0; %inicializo o vetor
  xl=x1; %Segunda aproximação inicial.
  erro= e; %constante de erro
  iterMax=itmax; %Número máximo de iterações
  % Funções utilizadas para esse método
  g=@(x) f(x);
  x(1)=xl-((xl-xu)*g(xl))/(g(xl)-g(xu));
  x(2)=x(1)-((x(1)-xu)*g(x(1)))/(g(x(1))-g(xu));
  ea(1)=abs(x(1)-xu);%Calculo do erro 1 e 2
  ea(2)=abs(x(2)-x(1));
  it=2;
  do
    it=it+1;
    x(it)=x(it-1)-((x(it-1)-x(it-2))*g(x(it-1)))/(g(x(it-1))-g(x(it-2)));
    ea(it)=abs((x(it)-x(it-1))/x(it));
  until ea(it) < erro || it >=iterMax
  X=1:1:(it);
  Y=1:1:(it);
  subplot(2,1,1);
  plot(Y,x,"-*");
  title("Aproximação da raiz em cada iteração");
  xlabel('Iteração')
  ylabel("Valor da iteração")
    grid();
  subplot(2,1,2);
  plot(X,ea,"-*");
  title('Gráfico de erros em função das iterações')
  xlabel('Iteração')
  ylabel("Erro relativo")
  grid()
  yy=x(it);
 endfunction

