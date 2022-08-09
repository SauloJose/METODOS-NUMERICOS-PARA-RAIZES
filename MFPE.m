%FalsaPosicaoErr
function [yy,ea,X] =MFPE(x0,x1,itmax,err)
  e=err;
  xl=x0;
  xu=x1;

  fl=f(xl)
  fu=f(xu)
  x(1)=xu-fu*(xl-xu)/(fl-fu);
  fr=f(x(1));

   %erros
   ea=abs(x1-x0)/abs(x1); %erro estimado
   it=1; %iteração atual.

  %Contabilizando o uso do XU e do XL
  iu=0;
  il=0;
  do
    it=it+1;
    teste=fr*fl;

    if teste <0
      xu=x(it-1);
      fu=f(xu);
      iu=0;
      il=il+1;
      if il>=2
        fl=fl/2;
      endif
    elseif teste>0
      xl=x(it-1);
      fl=f(xl);
      il=0;
      iu=iu+1;
      if iu>=2
        fu=fu/2;
      endif
    else
      yy=x(it-1);
      it=it-1;
      break
    endif
    x(it)=xu-fu*(xl-xu)/(fl-fu);
    fr=f(x(it));

    %calculando erros e solucionando caso de xr=0.
    if x(it)!= 0
      ea(it)=abs((x(it)-x(it-1))/x(it));
    else
      ea(it)=ea(it-1);
    endif


until ea(it) < e || it >= itmax

%Imprimindo dados
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
  grid()
  yy=x(it);
  it

endfunction
