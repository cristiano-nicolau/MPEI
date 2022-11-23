matriz=[0.1 0.2 0.25 0.25;
        0.3 0.4 0.25 0.25;
        0.3 0.2 0.25 0.25;
        0.3 0.2 0.25 0.25;];

%% Validar matriz
sum(matriz)

%% c)

v=[0;
    0;
    1;
    0;];

floresta7=matriz^7*v;
floresta7(3)



%% d)
Y = [matriz - eye(size(matriz));ones(1,4)];
sum(Y)
B= [zeros(4,1);1];
U = Y\B   %Valor Teorico vetor estacionario
U(3)
%% e)
v=[1/4 1/4 1/4 1/4]';

deserto1=matriz^1*v;
deserto2=matriz^2*v;

urbano4=matriz^4*v;
urbano5=matriz^5*v;

prob=deserto1(2)*deserto2(2)+urbano4(4)*urbano5(4)

