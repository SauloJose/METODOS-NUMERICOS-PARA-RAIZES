%Método de Newton-RAFAEL
function [X it Fr dFr X1]=MNRSistNL2(X0,erro)
  %[Xr it] = AproxSucessivas(A,B,Xo,erro)
  % Entradas:
  %Xo: Vetor de aprximação inicila
  %erro: erro esperado para a resposta
  %Saidas:
  %Xr: Vetor solução
  %it: Número de iterações necessárias

  %vetor solução
  Xr=[X0];
  Dxr=[X0];

  %definindo funções de iteração
  nx=@(x,y) x^3+3*y^2-21;
  ny=@(x,y) x^2+2y+2;

  %definindo derivadas parciais
  %função em x
  dnxx=@(x,y) 3*x^2;
  dnxy=@(x,y) 6*y;


  %função em y
  dnyx=@(x,y) 2*x;
  dnyy=@(x,y) 2;


  %definindo função F
  F=@(x,y) [nx(x,y);ny(x,y)];

  %Definindo função derivada.
  dF=@(x,y) [dnxx(x,y) dnxy(x,y);dnyx(x,y) dnyy(x,y)];

  %inversa da função derivada
  invdF=@(x,y) inv(dF(x,y));

  %variavel de iteração
  it=1;
  U=zeros(3,3);
  while(1)
     it=it+1;
     Xr(:,it)=Xr(:,it-1)-invdF(Xr(1,it-1),Xr(2,it-1))*F(Xr(1,it-1),Xr(2,it-1));
     Dxr(:,it)=Xr(:,it)-Xr(:,it-1);
    if norm(Dxr(:,it),2)<erro || it >=30
        break;
    end
  end

  X=Xr(:,it);
  %Imprimindo primeira iteração.
  Fr=F(Xr(1,1),Xr(2,1));
  dFr=dF(Xr(1,1),Xr(2,1));
  X1=Xr(:,2);

  %valores finais da função
  fprintf("Valores da função\n");
  nx(Xr(1,it),Xr(2,it))
  ny(Xr(1,it),Xr(2,it))
  nz(Xr(1,it),Xr(2,it))
  fprintf("\nResultados:");

end
