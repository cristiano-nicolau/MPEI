m=15;
k=0;
px0=leiPoisson(m,k);

fprintf("P(O computador nao recebe mensagens) = %.8f\n",px0);


%b)
% Para efeitos de calculo sera mais facil calcular a probabilidade
%do complemento (chegar 10 ou menos mensagens ao computador)

pX = zeros(1,11);

for k = 0 : 10
  i = k+1;
  pX(i) = leiPoisson(m,k);
end

pX10ouMenos = sum(pX);
pXmaisDe10 = 1-pX10ouMenos;

fprintf("P(O computador recebe mais de 10 mensagens) = %f\n",pXmaisDe10);