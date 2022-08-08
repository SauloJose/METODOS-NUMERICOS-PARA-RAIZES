
%Método do meio intervalo - Erro

function [yy, ea, X] = MIE(x0,x1,itmax,e)
  f=@(x) x^2-7*x+12;
  xl=x0;
  xu=x1;
  fu=f(xu);
  fl=f(xl);
  areal=-0.41468941;
  xr=(xl+xu)/2;
  fr=f(xr);
  err=e;

  ea=abs(x1-x0)/abs(x1);
  emaj=abs((x1-x0)/2^0);
  erel=abs((xr-areal)/xr);
  it=1;

  do
    it=it+1;
    xrold=xr;
    teste=fr*fl;

    if teste<0
      xu=xr;
      fu=f(xu);
    elseif teste>0
      xl=xr;
      fl=f(xl);
    else
      yy=xr;
      break;
    endif
    xr=xu-fu*(xl-xu)/(fl-fu);
    fr=f(xr);

    %calculando erros
    ea(it)=abs((xr-xrold)/xr);
    erel(it)=abs((xr-areal)/xr);
    emaj(it)=abs((x1-x0)/2^it);
  until ea(it) < err || it>=itmax

  X=1:1:it;
  plot(X,ea," - o ");
  title('Gráfico de erros em função das iterações');
  xlabel('Iterações');
  ylabel('Erro relativo');
  grid();
  yy=xr;
