NM=[5 5 10 20 20 80];

nJ_ex=[]; nnev=[]; h=[]; tau=[];
nnev(1)=0;
for i=1:2:5
   
    [res resN h(end+1) tau(end+1)]=ClearMeth(NM(i),NM(i+1));
    [ures uresN]=printSmall(res,resN,NM(i),NM(i+1));
     
   
    nJ_ex(end+1)=normMine(ures,uresN);
    if(i~=1)
        nnev(end+1)=normMine(ures,ures1);
    end
    
    ures1=ures;
end

matrix=[h' tau' nJ_ex' nnev'];
disp(matrix);

