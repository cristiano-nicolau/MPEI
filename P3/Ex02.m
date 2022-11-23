matriz=[ 1/3, 1/4 0;           %a
         1/3, 11/20 1/2;        %b
         1/3 1/5 1/2];          %c

format rat      %print em fracao

%% Verifica se a matriz esta bem
sum(matriz)
matriz>=0 & matriz<=1

%% vetor estado
v=[60;                    
  15;
  15]/90;

aula30=matriz^30*v*90

v=[30;                    
  30;
  30]/90;

aula31=matriz^30*v*90