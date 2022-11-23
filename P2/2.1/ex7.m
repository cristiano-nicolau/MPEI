N=1e5;
progA=rand(20,N) < 0.01;
progB=rand(30,N) < 0.05;
progC=rand(50,N) < 0.001;
progs=[progA;progB;progC];

cfavCerro=sum(sum(progC));
cfaverro=sum(sum(progs));

pC=cfavCerro/cfaverro;

cfavAerro=sum(sum(progA));
pA=cfavAerro/cfaverro;
cfavBerro=sum(sum(progB));
pB=cfavBerro/cfaverro;