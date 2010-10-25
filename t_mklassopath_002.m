%
clear;
p = complex(0,1);
q = complex(1,0);
r = 0.1;
mypp = mklassopath(p,q,r);
tt = linspace(0,1,100);


clf
plot(p,'r*');
axis equal;
hold on
plot(q,'ro');
plot(paracvval(mypp,tt));