%
clear;
p = complex(0,1);
q = complex(1,0);
r = 0.1;
mypp = mklassopath(p,q,r);
tt = linspace(0,1,100);

%% use paracvIdenticalDistrib
clf
plot(p,'r*');
axis equal;
hold on
plot(q,'ro');
plot(paracvV(mypp,paracvUniformDistrib(mypp,5)),'k');
%% use arcLength
arcl = quad(comp0(@abs,curry1(@paracvJ,mypp)), 0 ,1 );
N = 30;
ds = arcl/N;
TT = paracvArcLength(mypp,ds);
plot(paracvV(mypp,TT),'b.');
%% use paracvPdf
TT = paracvPdf(mypp,500,1000);
plot(paracvV(mypp,TT(floor(linspace(1,length(TT),50)))),'g.');