x=1:6; %vetor de 1 a 6
fx=ones(1,6)/6;% Cria um vetor com 6 linhas tudo com 1s devidindo por 6 sendo a probabilidade 1/6

figure(1)
subplote(1,2,1)
stem(x,fx)
xlim([0 7]) %x vai de 0 a 7 no grafico
grid on


subplote(1,2,2)
px=cumsum(fx);
stairs([0 x 7],[x,px])
ylim([0 1.1])
xlim([0 7]) %x vai de 0 a 7 no grafico
grid on