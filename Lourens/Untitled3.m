function f=dif32(t,x)% t, x — входные переменные для М-функции
%f=[-x(2)+x(3).^2;x(1)+1/2*x(2);x(1)-x(3)];
f=[x(2)+3.9*x(3);0.9*x(1).^2-x(2);1-x(1)];
end

function head()
clear all;
[T,X]=ode45(@dif32, [0 100], [0 0 0] ); 
s='.';
h=plot3(X(:,1),X(:,2),X(:,3));hold on 
xlabel('x');
ylabel('y');
zlabel('z');
pyan=zeros(1,2);
set(h, 'Color', 'black');
k=0;
  for i=1:size(X(:,1))
       if ((abs(X(i,3)+6)./sqrt(1))<0.3)
           k=k+1
           pyan(k,1)=X(i,1);
          pyan(k,2)=X(i,2);
       end;
  end;
  
  t=ones(size(pyan(:,1)),1)
  t(:)=-6

plot3(pyan(:,1),pyan(:,2),t,'.');hold off
% plot(pyan(:,1),pyan(:,2),'.');
end


