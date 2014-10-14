N=50;
h=0.1;
K=[-10;-9];
global Mx y
Mx=1; y=1;
yt=[];
ynabl=[];
ysub=[];
for i=1:h:N
    [t1 xn]=ode45(@Nabl,[i,i+h],[1,1]);
    ynabl(end+1)=xn(end,1);
    Mx=xn(end,:)*K;
     [t2 x]=ode45(@System,[i,i+h],[1,1]);
     y=x(end,1);
     yt(end+1)=y;
    % ysub(end+1)=y-xn(end,1);
end
plot([yt]);