% Test Case: 3 cusp quartic
% Equation: f(x,y)=y^4+4/3*(1+x)*y^3+2*x*y^2-1/3*x^2;
% Singularities: [0,0,1],[1,0,0],[1,1,1] three A_2's.
% Ramification points except the infinite line(z=0) : x=0,x=1;
function coeffs =cuspquartic(x)
    coeffs = [1,4/3*(1+x),2*x,0,-1/3*x^2];
end
