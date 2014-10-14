function res= ClearRes(A,t)
[S,J]=jordan(A);
Sinv=inv(S);
c=Sinv*[1;1];
res= S*expm(t*J)*c;
end

