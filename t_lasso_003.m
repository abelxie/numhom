clear;
p = complex(0,1);
q = complex(1,0);
r = 0.1;
mypp = mklassopath(p,q,r);

ff=mypp{1};
df=mypp{2};
%% 
% Test of f
figure(1);
clf;
hold on;
axis equal;

tt=linspace(0,1/6,10);
plot(ff{1}(tt));
tt=linspace(1/6,2/6,10);
plot(ff{2}(tt));
tt=linspace(2/6,4/6,10);
plot(ff{3}(tt));
tt=linspace(4/6,5/6,10);
plot(ff{4}(tt));
tt=linspace(5/6,1,10);
plot(ff{5}(tt),'r.');

%% 
% test of jacob
figure(2);
clf;
hold on;
axis equal;

tt=linspace(0,1/6,10);
plot(df{1}(tt),'bo');
tt=linspace(1/6,2/6,10);
plot(df{2}(tt),'b.');
tt=linspace(2/6,4/6,10);
plot(df{3}(tt),'r*');
tt=linspace(4/6,5/6,10);
plot(df{4}(tt),'r.');
tt=linspace(5/6,1,10);
plot(df{5}(tt),'ro');