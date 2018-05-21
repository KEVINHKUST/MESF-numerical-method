%woptimal=1.78 
w=1.78;
T=[100;zeros(29,1);100];
T2=[100;zeros(29,1);100];
k=0;
%T1=100 T31=100
while 1
for i=2:30
    T2(i)=(T2(i+1)+T2(i-1))/2.005041;
    T2(i)=w*T2(i)+(1-w)*T(i);
end
k=k+1;
if  max(abs(T-T2))<0.0001
    break;
else
    T=T2;
end
end
plot(0:1:30,T2);
xlabel('x/cm')
ylabel('T/¡æ')
