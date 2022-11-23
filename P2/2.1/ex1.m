
N=1e5;
p=0.5; %probablidade
k=1; %nr rapazes
n=2; %nr filhos

%a
lancamentos = rand(n, N) < p;

sucessos = sum(lancamentos)>=k; %pelo menos 1 rapaz

probSimulacaoa = sum(sucessos)/N

%c
%Sabendo que =>  P(B|A)=P(BA)/P(A)
B=sum(lancamentos)==2; %2 rapazes
A=sum(lancamentos)>=1; %pelo menos 1 rapaz
C=sum(B)/sum(A)


% Ex1_d
% P(A|B)
% A - família tem 2 rapazes
% B - o primeiro filho é rapaz

N = 1e5;
n = 2;
p = 0.5;

familias = rand(n,N) < p;

A = sum(familias)==2;
B = familias(1,:);
probd = sum(A)/sum(B)

% Ex1_e
% P(A|B)
% A - família tem pelo menos 1 rapaz
% B - família tem 2 rapazes

N = 1e5;
n = 5;
p = 0.5;

familia = rand(n,N) < p;                

A = sum(familia)>=1;
B = sum(familia)==2;
probe = sum(B)/sum(A)

% Ex1_f
% P(A|B)
% A - família tem pelo menos 1 rapaz
% B - família tem pelo menos 2 rapazes

N = 1e5;
n = 5;
p = 0.5;

familia = rand(n,N) < p;                

A = sum(familia)>=1;
B = sum(familia)>=2;
probf = sum(B)/sum(A)