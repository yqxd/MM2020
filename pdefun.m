function [c f s] = pdefun(x, t, u, ux)
    a = 1;    
    c = [1];
    y = u(1) - u(2);
    f = [a^2*ux(1)];
    s = [0];
end