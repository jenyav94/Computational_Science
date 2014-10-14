function Ynew = Runge(accurate,typeEuq,n)
[A B C G]=CoefForm(accurate,typeEuq,n);
Y1=ProgonMethod(A,B,C,G,n,accurate);
%y1s=size(Y1)
[A1 B1 C1 G1]=CoefForm(accurate,typeEuq,2*n);
Y2=ProgonMethod(A1,B1,C1,G1,2*n,accurate);


    
for i=0:n
    Y3(i+1)=Y2(2*i+1);
end

%y2s=size(Y3)
R=(Y3-Y1)/(2^(accurate)-1);
Ynew=Y3+R;

end

