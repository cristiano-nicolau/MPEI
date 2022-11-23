matriz=[ 0.7, 0.8;           %nao faltar
         0.3, 0.2];          %faltar

%% Verifica se a matriz esta bem
sum(matriz)
matriz>=0 & matriz<=1

%% vetor estado
v=[1;                    %nao faltar
  0];                    %faltar

%% a)
v_aula3= matriz^2 * v;
respostaA=v_aula3(1) %Print de nao faltar/ caso fosse faltar v_aula3(2)
%a probabilidade de estar presente na aula da quarta seguinte é igual a 0,73

%% b)
v=[0;               %nao faltar
   1];              %faltar

v_aula3= matriz^2 * v;
respostaB=v_aula3(1) %Print de nao faltar

%% c)
v=[1;                    %nao faltar
  0]; 

v_aula3= matriz^29 * v;
respostaC=v_aula3(1) 





%% d) grafico
pNaoFaltar=0.85;

v1=[pNaoFaltar;
    1-pNaoFaltar];

prob(1)=v1(2);

for  aula=1:2*15-1
    vetor=matriz^(aula) * v1;
    prob(aula+1)=vetor(2);
end

plot(1:30, prob, "bo:" )