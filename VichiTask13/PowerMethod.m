function [eig1 vect numIteration] = PowerMethod(A,eps)
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
           Yk=normVector(A*Y0);
           check=abs(Yk(2)-Yk(1));
           numIteration=0; 
         while(check>eps)
             numIteration=numIteration+1;
             Yk1=A*Yk;
             for i=1:n
                 lymbda(i)=Yk1(i)/Yk(i);
             end
             
             check=abs(lymbda(2)-lymbda(1));
             for i=3:n
                 temp=lymbda(i)-lymbda(i-1);
                 if temp>check
                     check=abs(temp);
                 end
             end
             Yk=normVector(Yk1);
         end
         vect=Yk/norm(Yk);
         eig1=MaxVectorValue(lymbda);
     else
         str='ERROR PowerMethod: nonsimmetric'
     end
     
    function max = MaxVectorValue(Y)
        max=Y(1);
        indexMax=1;
        for k=2:n
            if(Y(k)>max)
                max=Y(k);
                indexMax=k;
            end
        end
    end

    function vect= normVector(Yk)
        maxVal=MaxVectorValue(Yk);
        
        for i=1:n
            vect(i)=Yk(i)/maxVal;
        end
        vect=vect';
    end
end

