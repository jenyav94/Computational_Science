global A b x0;

accurate=100;

X=Descent(A,b,x0,accurate);

xacc=linsolve(A,b);

disp('������������ �������:')
disp(X)
disp('������ �������:')
disp(xacc)
disp('��������')
disp(xacc-X)
