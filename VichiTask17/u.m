function res = u(x, t)
res = exp(-0.25 * t) * cos(0.5 * x) + x * (1 - x) / (10 + t);
end