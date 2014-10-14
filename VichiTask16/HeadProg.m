a=0;
b=1;
syms x;
format long;
u3=FakeKer(3,a,b);
u4=FakeKer(4,a,b);

s=[a (a+b)/2 b];
for i=1:3
    um3(i)=subs(u3,x,s(i));
    um4(i)=subs(u4,x,s(i));
end
disp('u3');
disp(um3);
disp('u4');
disp(um4);
disp('u3-u4')
disp(um3-um4);
disp('max|u3-u4|');
disp(max(abs(um3-um4)));