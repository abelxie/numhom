function jacob = paracvJacob(ppcv,X)
    pp = ppcv{1};
    assert(all(pp.form=='paracv'), 'You must specify a paracv object.');
    fjacob = ppcv{3};
    N = length(X);   
    jacob = zeros(1,N);
    
    for iX = 1:N
        t = X(iX);
        if t==1
            ind = length(pp.breaks);
        else
            ind = find(t<pp.breaks,1);
        end
        if isempty(ind) || ind==1
            jacob(iX) = NaN;
        else 
            ind = ind-1;
            jacob(iX) = fjacob{ind}(t);
        end
    end
end