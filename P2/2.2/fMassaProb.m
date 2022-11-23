
function pX = fMassaProb (N,p,k,n)
  lancamentos = rand(n,N) < p;
  sucessos = sum(lancamentos) == k;
  pX = sum(sucessos)/N;
end
