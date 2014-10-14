function Y = LeastSq( n,N )
syms x;
digits(6);
a=-1;
b=1;
A=sym('-(6+x)/(7+3*x)');
B=sym('-(1-x/2)');
C=sym('1+cos(x)/2');
f=sym('1-x/3');

[Ac t]=Coef(N);

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
end
 

%for i=1:n
   % for j=1:n
     % G(i,j)=vpa(int(L(i)*L(j),'x',-1,1),5);
    %end
   % F(i)=vpa(int(f*L(i),-1,-1));
%end

for i=1:n
    for j=1:n
        Fc=L(i)*L(j);
        temp=0;
        for k=1:N
            temp=temp+Ac(k)*subs(Fc,x,(b-a)*t(k)/2+(b+a)/2);
        end
      G(i,j)=(b-a)*temp/2;
    end
        Fc=f*L(i);
        temp=0;
        for k=1:N
            temp=temp+Ac(k)*subs(Fc,x,(b-a)*t(k)/2+(b+a)/2);
        end
         F(i)=(b-a)*temp/2;
end
G=double(G)
cond(G)
F=double(F)
C=linsolve(G,F');
p=[-0.5 0 0.5];
for i=1:3
    Y(i)=dot(C,subs(w,x,p(i)));
end


end

 

