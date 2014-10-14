function f = System(t,x)
global kC kT q fO2 kC0 E Rz b
global T0 Tz uz
hC=fO2-kC0*x(1);
km=(T-T0)/(Tz-T0);
muT=km*exp(-E/(Rz*x(2)));
f=[-kC*x(1)-q(1)*hC*muT+b(1)*uz;-kT*x(2)+q(2)*hT*muT+b(2)*uz];
end

