function f = System(t,x)
global r
sigma=10; b=8/3;

f=[sigma*(x(2)-x(1)); -x(1)*x(3)+r*x(1)-x(2);x(1)*x(2)-b*x(3)];
end

