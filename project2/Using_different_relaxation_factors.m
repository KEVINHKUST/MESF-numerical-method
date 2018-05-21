% Record the relaxation factor w and number of iterations k
 
recordw=0;
recordk=0;
 
 % n is the index

n=1;

 % w is the relaxation factor
for w=1:0.01:1.99

 % T is the old temperature differences 
 % T2 is the new temperature differences
 % Initial guess£º0
 
T=[100;zeros(29,1);100];
T2=[100;zeros(29,1);100];

 % k calculate the number of iterations for each relaxation factor
 
k=0;

while 1
    
 % Gauss-Sidel iteration
 
for i=2:30
    T2(i)=(T2(i+1)+T2(i-1))/2.005041;
    T2(i)=w*T2(i)+(1-w)*T(i);
end

 % Add the number of iteration
 
k=k+1;

 % Convergence condition 

 if  max(abs(T-T2))<0.0001
    break;
 else
    T=T2;
 end
 
end

 % Record the w and k
 
recordw(n)=w;
recordk(n)=k;

 % Change the relaxation factor w and the index n
 
n=n+1;
end

plot(recordw,recordk);
xlabel('relaxation factor w')
ylabel('number of iterations')

    

