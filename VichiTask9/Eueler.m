function [Ytemp Y eg] = Eueler(A,a,b,h,y1,y2)
N=(b-a)/h;
if(h>=2/max(abs(eig(A))))
    disp('неустойчивость');
end
sz=size(A);
E=eye(sz(1));
Y=[y1;y2];
W=(E+A*h);
eg=eig(W);
for i=1:N
    Yk=W*Y(:,end);
    Y=[Y Yk];
    
end
Ytemp=[];
for i=1:5
Ytemp=[Ytemp Y(:,floor(i/(10*h)))];
end
disp('Eueler');
disp(Ytemp);

