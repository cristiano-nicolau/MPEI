
N=1e5;
nr_lancamentos=2;

%EX5.1

%A
lancamentos=randi([1,6],nr_lancamentos,N);
soma=sum(lancamentos); %soma dos 2 lancamentos igual a 9
iguais9=soma==9;
A=sum(iguais9);
pA=A/N;

%B
lancamentos2=lancamentos(2,:);%linha 2 
par=rem(lancamentos2,2)==0;
B=sum(par);
pB=B/N;

%C
 lancamentos3=lancamentos(1,:);%linha 1
 P1=lancamentos3==5;
 P2=lancamentos2==5;
 c=sum(P1|P2);
 pC=c/N;

 %D
P1=lancamentos3 ~=1;
P2=lancamentos2~=1;
d=sum(P1 & P2);
pD=d/N;

