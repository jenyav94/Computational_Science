function res = f(x, t)
res = -x .* (1 - x) ./ (10 + t)^2 + 2 / (10 + t);
end