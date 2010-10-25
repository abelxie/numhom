function [val,Ja] = pcmval(pcm,X)
% pcm is a piecewise cell mapping
% X is a complex number
% val is image of X and Ja is the Jacobian at this point
    function v = f(x)
        v = polyval([2,-3,0,1],x);
    end
    function v = fjacob(x)
        v = polyval([6,-6,0],x);
    end
    function [img,jacob] = oneval(x)
        ind = find( abs(x-pcm.P) < pcm.R , 1);
        img = x;
        jacob  = eye(2);
        if isempty(ind) % not in any cell, hence mapping is id
            return
        end
        
        dist = abs(x-pcm.P(ind));
        rr   = pcm.R(ind);
        vec  = pcm.Q(ind) - pcm.P(ind);
        img  = x + f(dist/rr) * vec;
        
        vec  = [real(vec);imag(vec)];
        xp   = x-pcm.P(ind);
        xp   = [real(xp),imag(xp)];
        if  ~dist == 0 
             jacob  = jacob + fjacob(dist/rr) / (rr*dist) * (vec * xp);
        end
    end
    
    N    =  length(X);
    val  =  zeros(1,N);
    Ja   =  cell(1,N);
    for iX = 1:N
        [val(iX),Ja{iX}] = oneval(X(iX));       
    end

end
