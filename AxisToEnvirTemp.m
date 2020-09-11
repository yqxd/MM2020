function result = AxisToEnvirTemp(x)
% ------------------------------------
% 根据对应的横坐标计算得到对应环境位置的温度
% x 为所输入的横坐标
% ------------------------------------
    global ReflowOven
    if size(AxisToArea(x)) == 1
        result = ReflowOven.Temp(AxisToArea(x))
    elseif size(AxisToBreak(x)) == 1
        Count = size(AxisToBreak(x));
        result = (ReflowOven.Axis(Count + 1, 1) * (x - Break.Axis(Count, 1)) + ReflowOven.Axis(Count, 2) * (Break.Axis(Count, 2) - x)) / 5; 
    elseif 0 <= x < 25
        
    elseif x > 524.5
        result = 25;
    end
end
        
            
        
        