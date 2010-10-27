clear;
p = complex(0,1);
q = complex(1,0);
r = 0.1;
mypp = mklassopath(p,q,r);

ff=mypp{1};
df=mypp{2};
breaks=mypp{3};
%% 
% Test of f
figure(1);
clf;
hold on;
axis equal;

tt=linspace(breaks(1),breaks(2),10);
plot(ff{1}(tt));
tt=linspace(breaks(2),breaks(3),10);
plot(ff{2}(tt));
tt=linspace(breaks(3),breaks(4),10);
plot(ff{3}(tt));
tt=linspace(breaks(4),breaks(5),10);
plot(ff{4}(tt));
tt=linspace(breaks(5),breaks(6),10);
plot(ff{5}(tt),'r.');

%% 
% test of jacob
figure(2);
clf;
hold on;
axis equal;

tt=linspace(breaks(1),breaks(2),10);
plot(df{1}(tt),'bo');
tt=linspace(breaks(2),breaks(3),10);
plot(df{2}(tt),'b.');
tt=linspace(breaks(3),breaks(4),10);
plot(df{3}(tt),'r*');
tt=linspace(breaks(4),breaks(5),10);
plot(df{4}(tt),'r.');
tt=linspace(breaks(5),breaks(6),10);
plot(df{5}(tt),'ro');