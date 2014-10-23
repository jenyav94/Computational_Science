function res = normMine(u, v, k)

temp = [];
for i = 1:6
    for j = 1:6
        temp(end+1) = abs(u(i,j) - v(i,j));
    end
end
res = max(temp);

end

