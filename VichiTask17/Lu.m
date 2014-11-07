function val= Lu(i, ui, xi, h)
syms x;
a = 1;
b = 0;
c = 0;

val = (ui(i+1) - 2*ui(i) + ui(i-1)) ./ (h^2);  %+ subs(b,x,xi(i)) .* (u(i+1)-u(i-1)) ./ (2*h);
val = double(val);
end

