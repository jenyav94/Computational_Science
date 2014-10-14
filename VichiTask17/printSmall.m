function [ures uresN] = printSmall( res,resN,N,M )
hx=floor(N/5); ht=floor(M/5);
ures=[]; uresN=[];

for i=0:5
    for j=0:5
        ures(i+1,j+1)=res(i*ht+1,j*hx+1);
        uresN(i+1,j+1)=resN(i*ht+1,j*hx+1);
    end
end

end

