function Y= Colac(n)
syms x;
digits(6);
A=sym('-(6+x)/(7+3*x)');
B=sym('-(1-x/2)');
C=sym('1+cos(x)/2');
f=sym('1-x/3');

wj=Jacobi(n-2);
%w(1)=x-x^2/2-5; 
%w(2)=x-x^3-8/3;  
w(1)=sym('x^2-2*x-5');
w(2)=sym('x^3-3*x-2');

for i=3:n
    w(i)=(1-x^2)^2*wj(i-2);
end


for i=1:n   
L(i)=A*diff(w(i),2)+B*diff(w(i))+C*w(i);
chebNul(i)=cos((2*i-1)*pi/(2*n));
end

for i=1:n
    for j=1:n
      G(i,j)=subs(L(j),x,chebNul(i));
    end
    F(i)=subs(f,x,chebNul(i));
end
G=double(G)
F=double(F)
C=linsolve(G,F');
p=[-0.5 0 0.5];
for i=1:3
    Y(i)=dot(C,subs(w,x,p(i)));
end
end


