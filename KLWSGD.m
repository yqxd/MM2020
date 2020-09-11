function answer = KLWSGD(x, y, X, Y)
global result OtherVariable
    answer = result(X+1, 1);
    add = 0;
    n = 0;
    l = 0.00015;
    a = OtherVariable.Zql;
    while true
        o = size(result, 1);
        inte = l*sum((result(:, Y)'- result(1, Y+1)) .* sin(([0:(o-1)]/200/1000+0.5)/l*pi.*[0:(o-1)]/200/1000)) / o;
        add = 2/(l) * inte * sin((pi/(2*l)+n*pi/l)*x);
        add = add * exp(-a*(pi/2/l+n*pi/l)^2); 
        if abs(add) < 1e-5
            break
        else
            answer = add + answer;
        end
        n = n + 1;
    end
    result(X+1, Y+1) = answer;
end
    