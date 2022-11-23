matriz=[8 0 3 0 0;            % estados n absorvente | estados absorventes
    2 6 2 0 0;                % 1 2 4 | 3 5
    0 1 4 0 0;
    0 3 0 0 0;
    0 0 1 0 0;]/10;
%% b
v=[1;
   0;
   0;
   0;
   0;];

prob=zeros(1,100);

for n=1 : 100
    v=matriz*v;
    prob(n)=v(2);
end

plot(prob)

%% d

nena=3; %nr de estados nao absorventes
q=matriz(1:nena,1:nena);  %matriz Q

%% e

F=inv(eye(size(q))-q); %matriz fundamental

%% f

