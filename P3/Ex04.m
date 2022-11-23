p=0.4;
q=0.6;
matriz=[p^2 0 0 q^2;
    (1-p)^2 0 0 q*(1-q);
    p*(1-p) 0 0 q*(1-q)
    p*(1-p) 1 1 (1-q)^2];

sum(matriz);
matriz>=0 & matriz<=1

v=[1;
    0;
    0;
    0];

matriz5=matriz^5;
v5=matriz5*v

matriz10=matriz^10;
v10=matriz10*v

matriz100=matriz^100;
v100=matriz100*v

matriz200=matriz^200;
v200=matriz200*v

%% calcular a probabilidade de limite 

b=[zeros(4,1);
    1];
M=[matriz-eye(size(matriz));
    ones(1,4)
    ];
u=M\b

