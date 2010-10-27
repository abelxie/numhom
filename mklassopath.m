function pp = mklassopath(p,q,r)
% Make a lasso like path from p, going around q with radius r in a counter 
% clockwise direction. We use cubic spline to approximiate the path, the 
% output is a paracv.
% p,q is complex
    l  = abs(p-q);
    ee  = (p-q)/l;
    v0  = r*ee;
    lambda = (l-r)/r;
    N   = 5;
    
    breaks = [lambda,lambda+1,lambda+1+pi,lambda+2+pi];
    breaks = [0,breaks/(2+2*lambda+pi),1];
    
    funs = cell(1,N);
    ff = funs;
    jacobs = cell(1,N);
    ja = jacobs;
    
    function dom = domain(tt)
        dom = @(t) (t-tt(1))/(tt(2)-tt(1));
    end
    function domj = domainj(tt)
        domj = @(t) 1/(tt(2)-tt(1));
    end

    % first define relative mapping t in [0,1], then transform according to
    % breaks.
    funs{1} =  @(x) p+x*(l-r)*(-ee);
    jacobs{1} = @(x) -(l-r)*ee;
    
    funs{2} = @(x) q-v0*( (x-1) + 1i*(2*x.^3-3*x.^2) );
    jacobs{2} = @(x) -v0*(1+1i*6*(x.^2 - x)) ;
    
    funs{3} = @(x) q+ 1i*v0*exp(1i*pi*x);
    jacobs{3} = @(x) -pi*v0*exp(1i*pi*x);
    
    funs{4} = @(x) q+v0*( x - 1i*(2*x.^3-3*x.^2 +1) );
    jacobs{4} = @(x) v0*(1 - 1i*6*(x.^2-x)); 
    
    funs{5} = @(x) p + (x-1)*(l-r)*ee;
    jacobs{5} = @(x) (l-r)*ee;
    
    for ind = 1:N
          [ff{ind},ja{ind}] = comp(funs{ind},domain(breaks(ind:ind+1)),...
              jacobs{ind},domainj(breaks(ind:ind+1)));
    end
    %breaks
    pp = mkparacv(breaks,ff,ja);
    %pp = {ff,ja,breaks,funs,jacobs};
end