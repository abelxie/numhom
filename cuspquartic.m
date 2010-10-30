function re=cuspquartic(z)
   sz=size(z);
   l=sz(1);
   if 1==sz(1)
       z=z.';
       l=sz(2);
   end;
    re=[ones(l,1),4/3*(1+z),2*z,zeros(l,1),-1/3*z.^2];
return
