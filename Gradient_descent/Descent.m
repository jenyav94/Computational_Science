function X = Descent(A,b,x0,accurate)

x1=x0;
sqA=A*A';
for i=1:accurate
    Rp=A*x1-b; %невязка
    MUp=dot(Rp,sqA*Rp)/dot(sqA*Rp,sqA*Rp); %вычисление mu
    
    x2=x1-MUp*A'*Rp; % основной шаг алгоритма
    x1=x2;
end
X=x1;

end

