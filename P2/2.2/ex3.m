%% a)
%Probabilidade de sair 0,1,2,3,4 coroas em 4 lançamentos de moedas
%equilibradas
fprintf("a)")
pX = zeros(1, 5);
x=0:4;

N=1e5;
p=0.5; %probablidade
n=4; %nr lancamentos
lancamentos = rand(n, N) < p;

for i=1:5
    k=i-1;
    sucessos = sum(lancamentos)==k; %pelo menos 1 rapaz
    probSimulacao = sum(sucessos)/N;
    pX(i)= sum(sucessos)/N;
    fprintf("P(%d)=%.6f \n",k,probSimulacao)
end

%% b)
fprintf("b)")
%Valor esperado = somatorio de i=0 ate m de xi * P(X = xi)
Media = 0;
for i=1 : 5
  Media  = Media + (i-1) * pX(i);
end


fprintf("E[X]: %d\n",Media);

%Variancia = E[X^2] - E^2[X]
Variancia = 0;
for i=1 : 5
  Variancia = Variancia + (i-1)^2 * pX(i);
end

var = Variancia - Media^2;

fprintf("Var(X)= %d\n",var);

%Desvio padrao = sqrt(var(X))
dp = sqrt(var);
fprintf("σX = %d\n",dp);

%% c)
% Esta variavel aleatoria apresenta o comportamento de uma Distribuicao Binomial
%visto que basicamente, temos 4 repeticoes de uma experiencia de Bernoulli (no 
%lancamento de uma moeda, podemos encarar que temos sucesso quando calha coroa
%e insucesso quando calha cara)

%Teoricamente, a expressao da Funcao de massa de prob. de uma variavel Binomial e:

%pX(k) = nCk * p^k * (1-p)^(n-k) = n! / (k! * (n-k)!) * p^k * (1-p)^(n-k)


%% d)
pXTeorica = zeros(1,5);
n = 4;
p = 1/2;

for i=1 : 5
  k = i-1;
  nCk = factorial(n)/(factorial(k) * factorial(n-k));
  pXTeorica(i) = nCk * p^k * (1-p)^(n-k);
end


%% e)

%% f)

%i)
p = sum(pXTeorica(x>=2));
fprintf("P(Pelo menos 2 coroas): %.6f\n",p);

%ii)
p = sum(pXTeorica(x<=1));
fprintf("P(Ate 1 coroa): %.6f\n",p);

%iii)
p = sum(pXTeorica(x>=1 & x<=3));
fprintf("P(Entre 1 e 3 coroas): %.6f\n",p);
