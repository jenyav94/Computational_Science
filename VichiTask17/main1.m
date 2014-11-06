%NM = [5 5 10 20 20 80];
%NM = [10 500 100 500];
NM = [10 500];

nJ_ex=[]; nnev=[]; h=[]; tau=[];
nnev(1)=0;
sz = size(NM);
for i=1:2:sz(2)
   
    % res is solution by ClearMeth
    % resN values of test function
    [res resN h(end+1) tau(end+1)] = ClearMeth(NM(i), NM(i+1));
    %disp_res = res(1:50:end, :);
    %disp(disp_res);
    disp_resN = resN(1:50:end, :);
    disp(disp_resN);
    
    %res on small grid
    %resN on small grid
    %%[ures uresN] = printSmall(res, resN, NM(i), NM(i+1));
     
    % || accurate_res - res ||
    %%nJ_ex(end+1) = normMine(ures, uresN);
   %% if(i~=1)
        % difference between close solutions 
       %% nnev(end+1) = normMine(ures, ures1);
   %% end
    
    %%ures1 = ures;
end

%matrix=[h' tau' nJ_ex' nnev'];
%disp(matrix);

