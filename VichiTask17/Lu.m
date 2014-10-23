function val= Lu(i, u, xi, h)
syms x;
a = 1;
b = sym('x^2+1');
c = 0;

val = (u(i+1) - 2*u(i) + u(i-1)) ./ (h^2) + subs(b,x,xi(i)) .* (u(i+1)-u(i-1)) ./ (2*h);
val = double(val);
end

