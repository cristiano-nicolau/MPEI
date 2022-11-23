clear all
load('L.mat');

%% a
a=find(L,100)
N=100;

%% b
H = [ones(N,N)]/N;


%% c
B = 0.85;
A = B*L + (1-B)*ones(N)/N;

%% d

Prr = ones(N,1) / N; % criacao do vetor pagerank 
for iter = 1:10
    Prr = L * Prr;
end
fprintf('PageRank: \n')
disp(Prr);

%% e
e=sort(Prr,100*100)

