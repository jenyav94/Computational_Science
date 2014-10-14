function [A t] = Coef( N )
syms x;

P=Legandr(N+1);
t=solve(P(end));
temp(1)=x;
for l=1:N
    temp(l)=1;
  for j=1:N
      if l~=j
         temp(l)=temp(l)*(x-t(j))/(t(l)-t(j));
      end
  end
  A(l)=int(temp(l)^2,x,-1,1);
end
end

