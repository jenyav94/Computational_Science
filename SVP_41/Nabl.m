function f = Nabl(t,x)
global Mx y
A=[0 1; 0 0]; 
B=[0;1];
C=[1 0];
L=[1;1];
f=[A*x+B*Mx+L*(y-C*x)];
end

