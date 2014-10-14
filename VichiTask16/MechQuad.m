function u = MechQuad(n,a,b)

H=sym('-0.46*cos(x*x*y)');
f=sym('x+0.46');
%f=sym('(-x*cos(x)*sin(1)+cos(1)*sin(x))/(-1+x^2)');
x=sym('x');
y=sym('y');
[A t]=Coef(n);

 function res= xk(s)
        res=(b-a)*t(s)/2+(b+a)/2;
 end

    
for j=1:n
    for k=1:n
        if j==k
            D(j,k)=1-(b-a)*A(k)*subs(subs(H,x,xk(j)),y,xk(k))/2;
        else
            D(j,k)=-(b-a)*A(k)*subs(subs(H,x,xk(j)),y,xk(k))/2;
        end
         
    end
    g(j)=subs(f,x,xk(j));
end
D=double(D);
g=double(g);
z=linsolve(D,g');

temp=sym('0');
for k=1:n
    temp=temp+(b-a)*A(k)*subs(H,y,xk(k))*z(k)/2;
end
u=temp+f;
val=[a (a+b)/2 b];

for i=1:3
    uval(i)=subs(u,x,val(i));
end
double(uval)
end

