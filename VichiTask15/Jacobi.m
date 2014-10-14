function w = Jacobi( n )
% ���������� ������������ �������.


k=2;
syms x;
 
w(2)=3*x;
w(1)=1;

for i=2:n-1
    ii=i-1;
%����� i - ����� �����. �-��, ii - ������� �������� �����
    w(i+1)=((2*k+2*ii+1)*(k+ii+1)*x*w(i)-(k+ii)*(k+ii+1)*w(i-1))/((ii+1)*(2*k+ii+1));
    w(i+1)=simplify(w(i+1));
    
end


end

