function Lor()

global r
rv=[13 0.5 28];
color=['k' 'r' 'b'];
%width=[3 3 0.5];
hold on;
for i=1:3
    r=rv(i);
[t,h]=ode45(@System,[0,1000],[20,20,20]);
x=h(:,1);
y=h(:,2);
z=h(:,3);

if (i==1 || i==3)
figure(i);
end

plot3(x,y,z,color(i));

 if i==2
 legend('r=13','r=0.5');
 elseif i==3
    legend('r=28');
 end
end

end

