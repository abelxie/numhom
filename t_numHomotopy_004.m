%t_numHomotopy_004
P0 = mklassopath(complex(0.5,0),complex(0,0),0.1);
figure(1);
clf;hold on;
axis equal;
plot(paracvV(P0,linspace(0,1,100)),'.');
[H0,foo] = numHomotopy(P0,@cuspquartic,@cuspquarticJ);
figure(2);clf;
hold on;
axis equal;
colors = 'rbgk';
for zz = 1:4
    plot(H0(:,zz),strcat(colors(zz),'.'));
end