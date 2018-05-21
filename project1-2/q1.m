%t,u,v are variables
syms u v t
syms h real
digits(8)
%h is step size
%u,v is from 0 to 1
x=5*u;
y=5*v;
z=(-0.38)+25/3*u+4/3*v-25/3*u*u-10/3*u*v;
%Q1t, t is from 0 to 1
qx=5*t;
qy=5*t;
qz=25/6*t*t-25/6*t+5;
distancesquare=(x-qx)^2+(y-qy)^2+(z-qz)^2;
%diff(distance,'t'),diff(distance,'u'),diff(distance,'v');
Ft=diff(distancesquare,'t');
Fu=diff(distancesquare,'u');
Fv=diff(distancesquare,'v');
%t0,u0,v0 are initial point;
t0=0.5;
u0=0.5;
v0=0.5;
for i=1:100
%deltat,deltau,deltav are numbers of partial derivation
deltat=eval(subs(Ft,[t,u,v],[t0,u0,v0]));
deltau=eval(subs(Fu,[t,u,v],[t0,u0,v0]));
deltav=eval(subs(Fv,[t,u,v],[t0,u0,v0]));
%t1,u1,v1 are variables
t1=t0+deltat*h;
u1=u0+deltau*h;
v1=v0+deltav*h;
newdistancesquare=subs(distancesquare,[t,u,v],[t1,u1,v1]);
%new t0,u0,v0
g=diff(newdistancesquare,'h');
h0=vpa(solve(g,h));
[r,c]=size(h0);
if r~= 1
    h0=h0.*((t0+deltat*h0>=0).*(t0+deltat*h0<=1).*(u0+deltau*h0>=0).*(u0+deltau*h0<=1).*(v0+deltav*h0>=0).*(v0+deltav*h0<=1));
    h0(find(h0==0))=[];
end
t0=t0+deltat*h0;
u0=u0+deltau*h0;
v0=v0+deltav*h0;
end
point_tuv=[t0,u0,v0]
distance=sqrt(eval(subs(distancesquare,[t,u,v],[t0,u0,v0])))
x=5*u0
y=5*v0
z=(-0.38)+25/3*u0+4/3*v0-25/3*u0*u0-10/3*u0*v0
qx=5*t0
qy=5*t0
qz=25/6*t0*t0-25/6*t0+5