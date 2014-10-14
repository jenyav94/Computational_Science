global A b x0;

accurate=100;

X=Descent(A,b,x0,accurate);

xacc=linsolve(A,b);

disp('Приближенное решение:')
disp(X)
disp('Точное решение:')
disp(xacc)
disp('Точность')
disp(xacc-X)
