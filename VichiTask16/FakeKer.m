function u = FakeKer(n,a,b)
syms x y;

H=sym('0.8*sin(x*y)');

alfa(1)=sym('x');
alfa(2)=sym('-x^3/6');
alfa(3)=sym('x^5/120');
alfa(4)=sym('-x^7/5040');
alfa(5)=sym('x^9/362880');

betta(1)=sym('0.8*x');
betta(2)=sym('0.8*x^3');
betta(3)=sym('0.8*x^5');
betta(4)=sym('0.8*x^7');
betta(5)=sym('0.8*x^9');

f=sym('x-0.8');
%f=sym('(-x*cos(x)*sin(1)+cos(1)*sin(x))/(-1+x^2)');

% gamma=int(beta(3)*alfa(3),'x',a,b);

for i=1:n
    B(i)=int(betta(i)*f,'x',a,b);
    for j=1:n
       gamma=int(betta(i)*alfa(j),'x',a,b);
       
       if i==j
            A(i,j)=1-gamma;
       else A(i,j)=-gamma;
       end
    end
end
A=double(A);
B=double(B);
C=linsolve(A,B');
temp=0;
for i=1:n
    temp=temp+C(i)*alfa(i);
end
u=f+temp;

D=inv(A);
G=0;
for i=1:n
    for j=1:n
      G=G+D(i,j)*alfa(i)*subs(betta(j),x,y);    
    end
end

a=double(0.0066715831290886651316895950003527);
b=double(0.000123493562015067846286224077);
c=double( 0.0010127831910027381330981);
d=double( 0.00012349356201506784339501);
e=double(0.13009604815230053631580631);
f=double( 0.028403838074062729794);
g=double(0.001012783191002738364394630);
h=f;
i=double(1.08486972621620516576967);

intG=a*sym('x^5')/6+b*sym('x^5')/4+c*sym('x^5')/2+d*sym('x^3')/6 +...
    e*sym('x^3')/4+f*sym('x^3')/2+g*sym('x')/6+h*sym('x')/4+i*sym('x')/2;
%ezplot(intG,[a,b]);
B=subs(intG,x,1);
disp(B);
FakeH=0;
for i=1:n
    FakeH=FakeH+alfa(i)*subs(betta(i),x,y);
end

a=double(0.0066666666666666666);
b=double( 0.133333333333333);
c=0.8;
intH=0.8+a*sym('x^5')/6+b*sym('x^3')/4+c*sym('x')/2;
%ezplot(intH,[a,b]);
eta=subs(intH,x,1);
disp(eta)
%(1+B)*eta
end

