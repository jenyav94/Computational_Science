function HeadProg(A,a,b,h,y1,y2)
Y=[];
for i=0.1:0.1:0.5
Y=[Y ClearRes(A,i)];
end
disp('Clear Res');
disp(Y);
egY=eig(A);

[YtempE YE egE]=Eueler(A,a,b,h,y1,y2);


[YtempIE YIE egIE]=InverseEueler(A,a,b,h,y1,y2);


[YtempA YA egA]=Adams(A,a,b,h,y1,y2);
%YA'

stEG=[egY(1); egY(2);egE(1);egE(2);egIE(1);egIE(2);egA(1);egA(1)];

%Y
%Y-YtempE
%Y-YtempIE
%Y-YtempA
stRes=[Y;Y-YtempE;Y-YtempIE;Y-YtempA];
%stEG 
%stRes
format long;
disp([stEG stRes]);

end

