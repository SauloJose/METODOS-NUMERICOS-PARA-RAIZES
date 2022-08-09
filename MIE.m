%Método do meio intevalo
function [yy, ea, X] = MIE(x0,x1,itmax,e)
  %iteração 0

  %observar quando a raiz está em um dos extremos do intervalo
  xl=x0;
  xu=x1;
  fl=f(xl);
  fu=f(xu);

  x(1)=(xl+xu)/2;
  fr=f(x(1));

  it=1;
  erro=e;

  %erros
  ea(it)=abs(x1-x0)/abs(x1); %erro estimado

  do
    teste=fr*fl;
    it=it+1;

    if teste <0
      xu=x(it-1);
      fu=f(xu);
    elseif teste>0
      xl=x(it-1);
      fl=f(xl);
    else
      yy=x(it-1);
      it=it-1;
      break
    endif
    x(it)=(xl+xu)/2;
    fr=f(x(it));

    %calculando erros
    ea(it)=abs((x(it)-x(it-1))/x(it));

   until ea(it) < erro || it >= itmax

%Imrpimindo gráfico
  X=1:1:(it);
  Y=1:1:(it);
  subplot(2,1,1);
  plot(Y,x,"-*");
  title("Aproximação da raiz em cada iteração");
  xlabel('Iteração');
  ylabel("Valor da iteração")
  grid();
  subplot(2,1,2);
  plot(X,ea,"-*");
  title('Gráfico de erros em função das iterações')
  xlabel('Iteração')
  ylabel("Erro relativo")
  grid();
  yy=x(it);
  it
endfunction
