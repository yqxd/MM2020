function result = AxisToEnvirTemp(x)
% ------------------------------------
% 根据对应的横坐标计算得到对应环境位置的温度
% x 为所输入的横坐标
% ------------------------------------
    global ReflowOven Break OtherVariable
    if x < 0
        result = 25;
    elseif x >= 339.5
        result = 25 + (ReflowOven.Temp(8) - 25) * exp(-OtherVariable.Kair*(x - 339.5));
    elseif size(AxisToBreak(x), 1) == 1
        Count = AxisToBreak(x);
        result = (ReflowOven.Temp(Count + 1) * (x - Break.Axis(Count, 1)) + ReflowOven.Temp(Count) * (Break.Axis(Count, 2) - x)) / 5; 
    elseif size(AxisToArea(x), 1) == 1
        Count = AxisToArea(x);
        result = ReflowOven.Temp(Count);
    elseif 0 <= x & x < 25
        result = (ReflowOven.Temp(1)*x + 25*(25-x))/25;
    end
end