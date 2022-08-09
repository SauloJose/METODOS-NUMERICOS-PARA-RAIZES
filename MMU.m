%Método de MULLER MMU;
function yy=MMU(xr,h,itmax,erro);
  %escolhendo pontos iniciais
  %obs: evitar começar com xr=0
  x2=xr;
  x1=xr+h*xr;
  x0=xr-h*xr;
  %adquirindo erro
  err=erro;
  it_max=itmax;

  %variável de iteração
  it=0;

  %definindo funçõa
  g=@(x) f(x);
  do
    it=it+1;
    %variáveis de controle
    h0=x1-x0
    h1=x2-x1
    d0=(g(x1)-g(x0))/h0
    d1=(g(x2)-g(x1))/h1

    %coeficientes da parábola:
    a=(d1-d0)/(h1+h0)
    b=a*h1+d1
    c=g(x2)

    %definindo determinante
    rad=sqrt(b*b-4*a*c);
    if abs(b+rad)>abs(b-rad)
      den=b+rad;
    else
      den=b-rad;
    endif
    dxr(it)=-2*c/den;

    %aproximação da raiz.
    x(it)=x2+dxr(it)

    %reatribuindo valores para próximo loop
    x0=x1;
    x1=x2;
    x2=x(it);
    %calculando erro da aproximação
    ea(it)= abs(dxr(it)/x(it));

  until ea(it)<err && abs(g(x(it)))<err || it>=it_max;
  %Imprimindo resultados para vizualizar.
  X=1:1:(it);
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
  yy=x(it);
  it
  grid()
endfunction

