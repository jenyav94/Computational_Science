function [eig1 vect numIteration] = ScalMultMethod(A,eps)
sz=size(A);
n=sz(1);
m=sz(2);

 %проверка на симметричность матрицы
 simmetric=true;
 for i=1:n
     for j=1:m
         if(A(i,j)~=A(j,i))
             simmetric=false;
         end
     end
 end
    
     if simmetric
           Y0=ones(n,1);
           %Y0(1)=0;
           Y0(n)=0;
           Yk=(A*Y0)/norm(A*Y0);
           Yk1=A*Yk;
           lymbdak=dot(Yk1,Yk);
           Yk=Yk1/norm(Yk1);
           check=abs(Yk(1)-Yk(2));
           numIteration=0;
         while(check>eps)
             numIteration=numIteration+1;
             Yk1=A*Yk;
             lymbdak1=dot(Yk1,Yk);
            
             check=abs(lymbdak1-lymbdak);
             Yk=Yk1/norm(Yk1);
             lymbdak= lymbdak1;
         end
         vect=Yk/norm(Yk);
         eig1=lymbdak;
         numIteration
     else
         str='ERROR PowerMethod: nonsimmetric'
     end
    
end


