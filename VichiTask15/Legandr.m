function P = Legandr( n)
syms x;

P(2)=x;
P(1)=1;

for i=2:n-1
    P(i+1)=(2*i-1)*x*P(i)/i-(i-1)*P(i-1)/i;
end

end

