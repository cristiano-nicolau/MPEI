matriz = zeros(20,20);

for k = 1 : 20
  r = rand(20, 1);
  r = r / sum(r);
  
  matriz(:,k) = r;
end 
sum(matriz)
matriz>=0 & matriz<=1
disp(matriz);
disp("É estocástica pois não temos entradas negativas e a soma de cada coluna dá sempre 1");


x0 = zeros(1,20)';
x0(1) = 1;

x2 = (matriz^2)*x0;
res2 = x2(20)*100

x5 = (matriz^5)*x0;
res5 = x5(20)*100

x10 = (matriz^10)*x0;
res10 = x10(20)*100

x100 = (matriz^100)*x0;
res100 = x100(20)*100