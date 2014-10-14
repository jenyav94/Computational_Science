function Y= ProgonMethod(A,B,C,G,n)
s=[]; t=[]; Y=[];
s(1)=C(1)/B(1);
  t(1)=-G(1)/B(1);
  
     for i=2:(n+1)
       s(i)=C(i)/(B(i)-A(i)*s(i-1));
       t(i)=(A(i)*t(i-1)-G(i))/(B(i)-A(i)*s(i-1));
     end
     
      Y(n+1)=t(n+1);
      for i=n:-1:1
       Y(i)=s(i)*Y(i+1)+t(i);
      end
end

