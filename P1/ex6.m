%a)
N= 1e5; %nu´mero de experieˆncias
p = 0.3; %probabilidade de cara
k = 3; %nu´mero de caras
n = 5; %nu´mero de lanc¸amentos
lancamentos = rand(n,N) < p;
sucessos= sum(lancamentos)==k;
probSimulacaoa= sum(sucessos)/N

%b)
N= 1e5; %nu´mero de experieˆncias
p = 0.3; %probabilidade de cara
k = 2; %nu´mero de caras
n = 5; %nu´mero de lanc¸amentos
lancamentos = rand(n,N) < p;
sucessos= sum(lancamentos)<=k;
probSimulacaob= sum(sucessos)/N

%c)
N = 1e6; %nr experiencias
p = 0.3;%prob de sair com defeito

n = 5;  %nr amostras

for x = 0:n

    defeituoso = rand(n,N) < p;
    
    defeitos = sum(defeituoso) == x;
    
    %disp(defeitos)
    probSimulacao = sum(defeitos)/N;

    P(x+1) = probSimulacao;
    fprintf("ProbSimulacao -> %.10f \n", probSimulacao);
end

stem([0,1,2,3,4,5],P)