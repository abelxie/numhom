function cv = mkparacv(breaks,funs,jacobs)
% Make a parametic C1 curve [0,1] --> R^2
% breaks are break points from 0 to 1 and 
% funs are the correspondding mapping forms
    N = length(funs);
    assert( length(breaks)-1 == N && length(jacobs) == N, ...
        'The number of funs and jacobs should equal to the number of breaks minus one');
    % C0 and C1 test
    for ib = 2:N
        pt = breaks(ib);
        assert( funs{ib-1}(pt)==funs{ib}(pt) , ...
            sprintf('Curve is not continuous at break: %d ',ib));
        assert( jacobs{ib-1}(pt)==jacobs{ib}(pt) , ...
            sprintf('The jacob of curve is not continuous at break: %d ',ib));
    end
    cv = struct('form','paracv', ...
        'breaks',breaks,...
        'f',funs,...
        'fjacob',jacobs);       
end