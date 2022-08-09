%Método de Steffenson (MST)
function [yy,ea,X]=MST(x0,itmax,err)
  x(1)=x0; %inicializo o vetor
  erro=err; %constante de erro
  iterMax=itmax; %Número máximo de iterações
  % Funções utilizadas para esse método
  g=@(x) f(x);
  %função inicial
  h=@(x) (g(x+g(x))-g(x))/g(x);

  x(2)=x(1)-g(x(1))/h(x(1));
  %erro inicial
  ea(1)=abs(x(2)-x(1));
  %Iterações
  it=2;
  do
    it=it+1;
    x(it)=x(it-1)-g(x(it-1))/h(x(it-1));
    ea(it-1)=abs((x(it)-x(it-1))/x(it));
  until ea(it-1) < erro || it >=iterMax
  X=1:1:(it-1);
  Y=1:1:(it);
  subplot(2,1,1);
  plot(Y,x,"-*");
  title("Aproximação da raiz em cada iteração");
  xlabel('iteraçoes')
  ylabel("Valor da iteração")
  grid();
  subplot(2,1,2);
  plot(X,ea,"-*");
  title('Gráfico de erros em função das iterações')
  xlabel('iteraçoes de erro')
  ylabel("Erro relativo")
  grid()
  yy=x(it);
endfunction
