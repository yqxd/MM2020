function [c f s] = pdefun(x, t, u, ux)
global OtherVariable
    a = 1;    
    c = [1];
    f = [OtherVariable.Zql*ux(1)];
    s = [0];
end