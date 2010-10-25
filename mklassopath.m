function pp = mklassopath(p,q,r)
% Make a lasso like path from p, going around q with radius r in a counter 
% clockwise direction. We use cubic spline to approximiate the path, the 
% output is a paracv.
% p,q is complex
    
    v0  = (p-q)/abs(p-q) * r;
    q1  = q+v0;
    breaks = [0,1/6,2/6,4/6,5/6,1];
    N = length(breaks)-1;
    assert(N == 5,'Internal Error.');
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
    funs{1} =  @(t) (1-t)*p + t*q1;
    jacobs{1} = @(t) -p + q1;
    
    funs{2} = @(t) q-v0*( t+1i*(2*t.^3 - 3*t.^2) - complex(1,0));
    jacobs{2} = @(t) -v0*(1+1i*(6*t.^2 - 6*t)) ;
    
    funs{3} = @(t) q+ 1i*v0*exp(1i*pi*t);
    jacobs{3} = @(t) -pi*v0*exp(1i*pi*t);
    
    funs{4} = @(t) q-v0*( (1-t)+1i*(2*t.^3-3*t.^2 +1) -complex(1,0));
    jacobs{4} = @(t) -v0*(-t+1i*(6*t.^2-6*t)); 
    
    funs{5} = @(t) t*p + (1-t)*q1;
    jacobs{5} = @(t) p-q1;
    for ind = 1:N
          [ff{ind},ja{ind}] = comp(funs{ind},domain(breaks(ind:ind+1)),...
              jacobs{ind},domainj(ind:ind+1));
    end
    %pp = mkparacv(breaks,ff,ja);
    pp = {ff,ja};
end