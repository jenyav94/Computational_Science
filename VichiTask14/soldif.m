function res= soldif(n)

    function res=p(x)
        res=-1/(2+x)-(1+x)*(2+x)/4;
    end

    function res=r(x)
        res=-(2+x)*cos(x/2)/2;
    end

    function res=f(x)
        res=-(2+x)^2/4;
    end

 
 format long;
 
    
    a=-1;
    b=1;        
    alpha1=-1;   
    alpha2=-1;   
    alpha=0;
    beta1=0;     
    beta2=1;
    beta=0;
    
%exact solution
    function tmp = twoode(x,y)
       tmp = [ y(2)              
              -p(x)*y(2)-r(x)*y(1)+f(x)];
       
    end
    
    function res = twobc(ya,yb)
         res = [ alpha1*ya(1)-alpha2*ya(2)-alpha
                 beta1*yb(1)+beta2*yb(2)-beta];
    end
    
    solinit = bvpinit(linspace(a,b,n+1),[0.6 0]);
    options = bvpset('Reltol',1e-06,'abstol',1e-06,'Nmax',1e10);
    sol = bvp4c(@twoode,@twobc,solinit,options);
        
    x = linspace(a,b,n+1);
    ExSol = deval(sol,x);%»нтерпол€ци€
    %disp('ExSol');
    %disp(ExSol(1,:));
    mas=[x;ExSol(1,:)];
    res=ExSol(1,:);
   % fprintf('%5.2f  %10.5f \n',mas);
end



