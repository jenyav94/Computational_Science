function [res resN h tau]= ClearMeth(N,M)

T=0.1;
h=1/N;
i=0:N;
xi=i*h;
tau=T/M;
k=0:M;
tk=k*tau;

 res=[];
 resN=[];

% syms x t;

% f=sym('-x * (1 - x)/(10 + t)^2 + 2/(10 + t) ');
% phi1=('cos(0.5 * x) + x * (1 - x)/10.0');
% alfa=('exp(-0.25 * t)');
% betta=('exp(-0.25 * t) * cos(0.5)');
% u=sym('exp(-0.25*t) * cos(0.5 * x) + (x *(1 - x) )/(10 + t)');

% f=sym('3*t^2-6*x-(x^2+1)*3*x^2');
% phi=('x^3');
% alfa=('0');
% betta=('3');
% u=sym('x^3+t^3');

% f=sym('-x^2');
% phi=('x');
% alfa=('1');
% betta=('1');
% u=sym('x+t');

i = 1:(N+1);
ui_0 = phi(xi(i));

ui_0temp = ui_0(2:N);
i = 2:N;
ui_1 = ui_0temp + tau .* (Lu(i, ui_0, xi, h) + f(xi(i), tk(1)) );

u0_1 = alfa(tk(2));  %-alfa(tk(2)) * 2 * h/3 + 4 * ui_1(1)/3 - ui_1(2)/3;
uN_1 = betta(tk(2)); %betta(tk(2)) * 2*h/3 + 4*ui_1(N-1)/3 - ui_1(N-2)/3;
ui_1 = [u0_1 ui_1 uN_1];

k = 2;
ui_k1 = ui_1;
res = [ui_0; ui_1];
while (k <= M)
    ui_k1temp = ui_k1(2:N);
    i = 2:N;
    ui_k = ui_k1temp + tau.*(Lu(i, ui_k1, xi, h) + f(xi(i), tk(k)));

    
    u0_k = alfa(tk(k + 1)); % -alfa(tk(k + 1))*2*h/3 + 4*ui_k(1)/3 - ui_k(2)/3;
    uN_k = betta(tk(k + 1)); % betta(tk(k + 1))*2*h/3 + 4*ui_k(N-1)/3 - ui_k(N-2)/3;
    
    ui_k = [u0_k ui_k uN_k];
    
    res = [res;ui_k];
    ui_k1 = ui_k;
    k = k + 1;
end


for i = 1:(M+1)
    for j = 1:(N+1)
        resN(i,j) = u(xi(j), tk(i));
    end
end
disp(res(1:50:end,:));
disp(resN(1:50:end,:));
%disp(abs(res-resN));

end
