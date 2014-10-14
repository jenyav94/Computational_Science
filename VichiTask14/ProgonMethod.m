function Y= ProgonMethod( A,B,C,G,n,accurate )
  s(1)=C(1)/B(1);
  t(1)=-G(1)/B(1);
  
  if accurate==1
      for i=2:(n+1)
       s(i)=C(i)/(B(i)-A(i)*s(i-1));
       t(i)=(A(i)*t(i-1)-G(i))/(B(i)-A(i)*s(i-1));
      end
  
      Y(n+1)=t(n+1);
      for i=n:-1:1
       Y(i)=s(i)*Y(i+1)+t(i);
      end
   
  elseif accurate==2
      for i=2:(n+2)
       s(i)=C(i)/(B(i)-A(i)*s(i-1));
       t(i)=(A(i)*t(i-1)-G(i))/(B(i)-A(i)*s(i-1));
      end
  
      Y(n+2)=t(n+2);
      for i=(n+1):-1:1
       Y(i)=s(i)*Y(i+1)+t(i);
      end
     
      for i=1:n+1 %переход к исходной сетке
        Ym(i)=(Y(i)+Y(i+1))/2;
      end
      Y=Ym;
  end
  
end

