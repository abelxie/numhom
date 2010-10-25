%Unit Test
myp = complex(0,0);
myq = complex(1/4,0);
myr = 1;
mypcm = mkpcm(myp,myq,myr);

lin = linspace(3*exp(1i*3/4*pi),-3*exp(1i*3/4*pi),50);
[Tlin,TJ] = pcmval(mypcm,lin);
plot(lin,'b');
hold on;
axis equal;
plot(exp(1i*linspace(0,2*pi,50)));
plot(Tlin,'r');
