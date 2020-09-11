function result = TimeToTemp(t)
% ------------------------------------
% 根据对应的时间计算得到对应电路板的温度
% x 为所输入的横坐标
% ------------------------------------
    global OtherVariable
    n = 0;
    k = 25;
    T = AxisToEnvirTemp(OtherVariable.RunRate*t);
    a = 149/(2330*703);
    l = 0.15/1000;
    result = T;
    while true
        add = 2*(k-T)/(n+0.5)/pi*exp(-(pi/(2*l)+n*pi/l)^2*a*t)*(-1)^n;
        if abs(add) < 1e-4
            break
        else
            result = result + add;
        end
        n = n + 1;
    end
end