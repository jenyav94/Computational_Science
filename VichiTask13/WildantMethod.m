function [eig1 vect numIteration]= WildantMethod(A,eg0,eps)
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
           E=eye(n);
           W=A-eg0*E;
           C=rref([W Y0]); %Приведение расширенной матрицы к треугольному виду
           Yk=C(1:3,4:4);  %Выделение последнего столбца из матрицы
           
           mu=Yk(1)/Y0(1);
           egk=1/mu+eg0;
           check=abs(Yk(1)-Yk(2));
           numIteration=0;
         while(check>eps)
             numIteration=1+numIteration;
           W=A-egk*E;
           C=rref([W Yk]); %Приведение расширенной матрицы к треугольному виду
           Yk1=C(1:3,4:4);  %Выделение последнего столбца из матрицы
           
           mu=Yk1(1)/Yk(1);
           egk1=1/mu+egk;
           check=abs(egk1-egk);
          
           Yk=Yk1;
         end
       
         vect=Yk/norm(Yk);
         eig1=egk;
     else
         str='ERROR PowerMethod: nonsimmetric'
     end
end

