function re = mkpcm(P,Q,R)
% The main purpose here is to do the data verification
% assuming P and Q are complex number representing points
% R is a same length vector presenting radius
    N = length(P);
    assert(  all(N == [length(Q), length(R)] ), ...
        'The length of input should be equal');
    assert(  all (R>0) , ...
        'The radius must be positive');
    assert( all( abs(Q-P) <= R/2 ) , ...
        'The variant point Q should be in the half cell O(P,R/2)');
    for iP = 1:N-1
        for jP = iP+1:N
            assert( abs(P(iP) - P(jP)) >= R(iP) + R(jP) );
        end
    end
    re = struct('P',P,'Q',Q,'R',R);
end
    