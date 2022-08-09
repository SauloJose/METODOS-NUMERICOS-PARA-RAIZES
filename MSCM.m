%Método da secante modificado MSCM()
function yy=MSCM(x0,pert,itmax,err)
  x(1)=x0; %inicializo o vetor
  erro=err; %constante de erro
  iterMax=itmax; %Número máximo de iterações
  d=pert; %pertubação
  % Funções utilizadas para esse método
  g=@(x) f(x);
  dg=@(x) (f(x+d*x)-f(x))/d;
  it=1;
  do
    it=it+1;
    x(it)=x(it-1)-g(x(it-1))/dg(x(it-1));
    ea(it-1)=abs((x(it)-x(it-1))/x(it));
  until ea(it-1) < erro || it >=iterMax
  X=1:1:(it-1);
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
