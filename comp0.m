function rf = comp0(f,g)
% composition of f and g
% Note we use comp to compose not only f and g , but also their Jacobs
    rf = @(x) f(g(x));
end