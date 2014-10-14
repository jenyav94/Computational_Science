function [A B C G] = CoefForm(accurate,typeEqu,n)
  const;
  if accurate==1
      h=(b-a)/n;
      for i=0:n
          x(i+1)=a+i*h;
      end
      
      A(1)=0;
      B(1)=-(alfa1+alfa2/h);
      C(1)=-alfa2/h;
      G(1)=alffa;
      A(n+1)=-beta2/h; %-beta2/h;
      B(n+1)=beta1+beta2/h;
      C(n+1)=0;
      G(n+1)=betta;
      
      if typeEqu==1
        for i=2:n
            pt=p(x(i));
            qt=q(x(i));
            ft=f(x(i));
            rt=r(x(i));
            h2=h^2;
            A(i)=-pt/h2+qt/(2*h);
            B(i)=2*pt/h2+rt;
            C(i)=-pt/h2+qt/(2*h);
            G(i)=ft;
        end
    elseif typeEqu==2
        for i=2:n
            pphalf=p(x(i)+h/2);
            pmhalf=p(x(i)-h/2);
            qt=q(x(i));
            ft=f(x(i));
            rt=r(x(i));
            h2=h^2;
            A(i)=-pmhalf/h2-qt/(2*h);
            B(i)=-(pphalf/h2+pmhalf/h2+rt);
            C(i)=-pphalf/h2+qt/(2*h);
            G(i)=ft;
        end
      else mess='Error in type'
        A=0;
        B=0;
        C=0;
        G=0;
        return;
      end
  elseif(accurate==2)
       h=(b-a)/n;
       for i=0:(n+1)
         x(i+1)=a-h/2+i*h;  
       end
      A(1)=0; 
      B(1)=-(alfa1/2+alfa2/h);
      C(1)=alfa1/2-alfa2/h;
      G(1)=alffa;
      A(n+2)=-(beta1/2-beta2/h);
      B(n+2)=-(beta1/2-beta2/h);
      C(n+2)=0;
      G(n+2)=betta;
      
     if typeEqu==1
        for i=2:(n+1)
            pt=p(x(i));
            qt=q(x(i));
            ft=f(x(i));
            rt=r(x(i));
            h2=h^2;
            A(i)=-pt/h2+qt/(2*h);
            B(i)=2*pt/h2+rt;
            C(i)=-pt/h2+qt/(2*h);
            G(i)=ft;
        end
    elseif typeEqu==2
        for i=2:(n+1)
            pphalf=p(x(i)+h/2);
            pmhalf=p(x(i)-h/2);
            qt=q(x(i));
            ft=f(x(i));
            rt=r(x(i));
            h2=h^2;
            A(i)=-pmhalf/h2-qt/(2*h);
            B(i)=-(pphalf/h2+pmhalf/h2+rt);
            C(i)=-pphalf/h2+qt/(2*h);
            G(i)=ft;
        end
      else mess='Error in type'
        A=0;
        B=0;
        C=0;
        G=0;
        return;
      end
  else mess='Error in accurate'
      A=0;
      B=0;
      C=0;
      G=0;
      return;
  end
     
    
    
end

