%Seja X = # de erros tipograficos presentes numa determinada pagina de um livro

m = 0.02*100;
k = 0;
pZeroErros = leiPoisson(m,k);
k = 1;
pUmErros = leiPoisson(m,k);
px=pUmErros+pZeroErros