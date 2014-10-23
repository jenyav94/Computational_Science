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

syms x t;

f=sym('-x * (1 - x)/(10 + t)^2 + 2/(10 + t) ');
phi=('cos(0.5 * x) + x * (1 - x)/10.0');
alfa=('exp(-0.25 * t)');
betta=('exp(-0.25 * t) * cos(0.5)');

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
ui_0 = subs(phi, x, xi(i));

ui_0 = double(ui_0);

ui_0temp = ui_0(2:N);
i = 2:N;
ui_1 = ui_0temp + tau .* (Lu(i, ui_0, xi,h) + subs(subs(f, x, xi(i)), t, tk(1)) );

ui_1 = double(ui_1);

u0_1 = -subs(alfa, t, tk(2)) * 2 * h/3 + 4 * ui_1(1)/3 - ui_1(2)/3;
uN_1 = subs(betta,t,tk(2)) * 2*h/3 + 4*ui_1(N-1)/3 - ui_1(N-2)/3;
ui_1 = [u0_1 ui_1 uN_1];

u0_1 = double(u0_1);
uN_1 = double(uN_1);
ui_1 = double(ui_1);

k = 2;
ui_k1 = ui_1;
res = [ui_0; ui_1];
while (k <= M)
    ui_k1temp = ui_k1(2:N);
    i = 2:N;
    ui_k = ui_k1temp + tau.*(Lu(i,ui_k1,xi,h) + subs(subs(f, x, xi(i)), t, tk(k)));
    
    ui_k = double(ui_k);

    u0_k = -subs(alfa, t, tk(k+1))*2*h/3 + 4*ui_k(1)/3 - ui_k(2)/3;
    uN_k = subs(betta, t, tk(k+1))*2*h/3 + 4*ui_k(N-1)/3 - ui_k(N-2)/3;
    
    u0_k = double(u0_k);
    uN_k = double(uN_k);
    
    ui_k = [u0_k ui_k uN_k];
    
    res = [res;ui_k];
    ui_k1 = ui_k;
    k = k + 1;
end

% for i = 1:(M+1)
%     for j = 1:(N+1)
%         resN(i,j) = subs(subs(u, x, xi(j)), t, tk(i));
%     end
% end
%disp(res);
% disp(resN);
% disp(abs(res-resN));

end
