function [res resN h tau] = weightMeth(N,M,sigma)
T=0.1;
h=1/N;
i=0:N;
xi=i*h;
tau=T/M;
k=0:M;
tk=k*tau;

if(sigma==1/2)
    tch1=tk(2)-tau/2;
elseif(sigma==1)
   tch1= tk(2);
elseif(sigma==0)
   tch1= tk(1);
end

A=[]; B=[]; C=[]; G=[]; res=[]; resN=[];

syms x t;

f=sym('3*t^2-6*x-(x^2+1)*3*x^2');
phi=('x^3');
alfa=('0');
betta=('3');
u=sym('x^3+t^3');

% f=sym('-x^2');
% phi=('x');
% alfa=('1');
% betta=('1');
% u=sym('x+t');

i=1:(N+1);
ui_0=subs(phi,x,xi(i));

ui_0temp=ui_0(2:N);
i=2:N;
G=-ui_0temp./tau-(1-sigma).*Lu(i,ui_0,xi,h)-subs(subs(f,x,xi(i)),t,tch1);
G=[subs(alfa,t,tk(2)) G subs(betta,t,tk(2))];

i=2:N;
A=(1/(h^2)-(xi(i).^2+1)./(2*h)).*sigma;
A=[0 A -1/h];


i=1:(N-1);
B(i)=2*sigma/(h^2)+1/tau;
B=[1/h B -1/h];

i=2:N;
C=(1/(h^2)+(xi(i).^2+1)./(2*h)).*sigma;
C=[1/h C 0];

ui_1=ProgonMethod(A,B,C,G,N);

k=2;
ui_k1=ui_1;
res=[ui_0;ui_1];
while (k<=(M))
    
    if(sigma==1/2)
    tchk=tk(k+1)-tau/2;
    elseif(sigma==1)
    tchk=tk(k+1);
    elseif(sigma==0)
    tchk=tk(k);
    end
     ui_k1temp=ui_k1(2:N);
     i=2:N;
     temp1=-ui_k1temp./tau;
     temp2=(1-sigma).*Lu(i,ui_k1,xi,h);
     temp3=subs(subs(f,x,xi(i)),t,tchk);
     G=-ui_k1temp./tau-(1-sigma).*Lu(i,ui_k1,xi,h)-subs(subs(f,x,xi(i)),t,tchk);
     G=[subs(alfa,t,tk(k+1)) G subs(betta,t,tk(k+1))];
     
     ui_k=ProgonMethod(A,B,C,G,N);
     
     res=[res;ui_k];
     ui_k1=ui_k;
     k=k+1;
end

for i=1:(M+1)
    for j=1:(N+1)
        resN(i,j)=subs(subs(u,x,xi(j)),t,tk(i));
    end
end
% %format long;
% format short;
% 
% %disp(xi);
% %disp(tk);
% disp(res);
% disp(resN);
% disp(abs(res-resN));

end
