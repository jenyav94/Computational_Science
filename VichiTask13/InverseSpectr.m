function [eig vect]=InverseSpectr(A,eps)
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
          lymbda1=ScalMultMethod(A,eps);
          E=eye(n);
          B=A-lymbda1*E;
          
          [lymbda2 vect]=ScalMultMethod(B,eps);
          eig=lymbda2+lymbda1;
         
     else
         str='ERROR PowerMethod: nonsimmetric'
     end

end

