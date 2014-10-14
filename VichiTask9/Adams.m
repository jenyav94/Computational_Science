function [Ytemp Y eg] = Adams(A,a,b,h,y1,y2)
N=(b-a)/h;
sz=size(A);
E=eye(sz(1));
Y=[y1;y2];
Ytemp=Y;

W=E/(E-A*(h^3));
eg=eig(A);
max(abs(eg))*h
n=floor(h/(h^3));
for i=1:n-1
 Yk=W*Ytemp(:,end);
    Ytemp=[Ytemp Yk];
end
Y=[Y Ytemp(:,end)];
%Ytemp(:,end)-ClearRes(A,h)

for i=1:N
    Yk=(E+A*3*h/2)*Y(:,end)-((h/2)*A)*Y(:,(end-1));
    Y=[Y Yk];
end

Ytemp=[];
for i=1:5
Ytemp=[Ytemp Y(:,floor(i/(10*h))+1)];
end
disp('Adams');
disp(Ytemp);

end
