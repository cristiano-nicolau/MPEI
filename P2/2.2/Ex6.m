%1000 chips -> 1 defeituoso, ou seja, p(defeituoso) = 1/1000

%Amostra de 8000 -> n
%B : "# de chips defeituosas que aparecem numa amostra com 8000 chips"

% Podemos considerar que B apresenta as caracteristicas de uma Distribuicao Binomial
%visto que se trata da repeticao da experiencia de Bernoulli onde sucesso ocorre quando
%aparece um chip defeituoso e insucesso quando aparece um chip que nao tem defeitos

%Sabemos portanto que:
%pB(k) = nCk * p^k * (1-p)^(n-k) = n! / (k! * (n-k)!) * p^k * (1-p)^(n-k)

n=8000;
p=1/1000;
k=7;
ncK= prod(n:-1:n-k+1)/prod(1:k);
pB=ncK * p^k * (1-p)^(n-k)


pBS = zeros(1,51);
m=8000*p;
for k=0 : 50
    pBS(k+1)=leiPoisson(m,k);
end
x = 0:50;
stem(x,pBS,'o');

hold off;
