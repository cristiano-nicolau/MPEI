clear all

matriz=[0.7 0.2 0.3;
    0.2 0.3 0.3;
    0.1 0.5 0.4;
    ];

sum(matriz);

v=[1;
    0;
    0];

%% haver sol ao 3ºdia

x1 = (matriz^1)*x0;
x2 = (matriz^2)*x0;

prob_2Sol = x1(1)
prob_3Sol = x2(1)

%% probabilidade ñ chover

prob_2nChover = x1(1) + x1(2)
prob_3nChover = x2(1) + x2(2)

%% d
diassol=1;
diaschuva=0;

for i=2:31
    v=matriz*v;

    diassol=diassol+v(1);
    diaschuva=diaschuva+v(3);
end

%% e

diassole=0;
diaschuvaa=1;

for i=2:31
    v=matriz*v;

    diassole=diassole+v(1);
    diaschuvaa=diaschuvaa+v(3);
end


%% f

for i=2:31
    v=matriz*v;

    pdoente=0.1*v(1)+0.3*v(2)+0.5*v(3);
end

