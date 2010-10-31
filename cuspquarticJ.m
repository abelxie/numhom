% The Jacob of [Test Case: 3 cusp quartic]
% Equation: f(x,y)=y^4+4/3*(1+x)*y^3+2*x*y^2-1/3*x^2;
% Singularities: [0,0,1],[1,0,0],[1,1,1] three A_2's.
% Ramification points except the infinite line(z=0) : x=0,x=1;
function jacob =cuspquarticJ(x,y)
    dfx = 4/3*y^3+2*y^2-2/3*x;
    dfy = 4*y^3+4*(1+x)*y^2+4*x*y;
    jacob = - dfx/dfy;
end
