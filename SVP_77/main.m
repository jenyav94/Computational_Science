global kC kT q fO2 kC0 E Rz b c y1 y2
global x0 T0 Tz Cz uz eps

tf=6;
dt=0.01;
T=100;
SS=0.5;
N=T/SS;
kC=-1;
kT=-2;
q=[-0.01 0.01];
fO2=0.95; 
y1=3;
kC0=0.1;
E=150; 
Rz=8.3;
b=[1 483];
c=0.69;

x0=[2 500];
T0=300;
Tz=1000;
Cz=4.1460;
y2=3;
uz=4.1460;
eps=0.0001;

yt=[];
y=[];
while(abs(y1-y2)>eps)
for i=1:dt:tf
     [t2 x]=ode45(@System,[i,i+dt],[1,1]);
     y=x(end,1);
     yt(end+1)=y;
end

end

[A B Q R]=minimize(y,yt);


[k p e]= dlqr(A, B, Q, R);

x = zeros(2, N);
u= zeros(2, N-1);

x(1,1)=2;
x(2,1)=1;


for i=1:N-1,
    u(:, i)= - k*x(:, i);
    x(:, i+1)=A*x(:, i)+B*u(:, i);
end

x1= x(1,:);
x2= x(2,:);
t = 0:SS:T-SS;

subplot(4, 1, 1); 
plot(t, x1, 'b'); 
subplot(4, 1, 2);
plot(t, x2, 'g');

subplot(4, 1, 3);
plot(SS:SS:T-SS, u(1, :), 'y');

subplot(4, 1, 4);
plot(SS:SS:T-SS, u(2, :), 'r');