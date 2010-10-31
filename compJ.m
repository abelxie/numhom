function vj = compJ(fj,g,gj)
    % chain rule f(g(x))' = f'(g(x))*g'(x);
    vj = @(x) fj(g(x))*gj(x);
end