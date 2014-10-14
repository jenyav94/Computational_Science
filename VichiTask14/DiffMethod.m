function [Y Yrunge YAcc] = DiffMethod(accurate,typeEuq,n)
[A B C G]=CoefForm(accurate,typeEuq,n);
%A1=A*((0.2)^2)
%B1=B*((0.2)^2)
%C1=C*((0.2)^2)
%G1=G*((0.2)^2)

Y=ProgonMethod(A,B,C,G,n,accurate);

Yrunge=Runge(accurate,typeEuq,n);

YAcc=soldif(n);

mat=[Y' Yrunge' YAcc']
%abs(Yrunge-AccRes)
%format long;
end

