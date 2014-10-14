%function Y = LeastSq( n )
clc
n=6
syms x;
digits(6);
A=sym('-(6+x)/(7+3*x)')
B=sym('-(1-x/2)')
C=sym('1+cos(x)/2')
f=sym('1-x/3')
w(1)=sym('x^2-2*x-5');
w(2)=sym('x^3-3*x-2');
wj=Jacobi(n-2);

for i=3:n
    w(i)=(1-x^2)^2*wj(i-2);
end

for i=1:n   
L(i)=A*diff(w(i),2)+B*diff(w(i))+C*w(i);
end

for i=1:n
    for j=1:n
G(i,j)=vpa(int((L(i)*L(j)),'x',-1,1),10);
    end
    F(i)=vpa(int(f*L(i),-1,1),10);
end
G
F
  C=G\F'


