function result = CheckCondition()
% ------------------------------------
% 根据已知的全局变量检查是否符合Table1限制条件。用于主函数的辅助函数
% 在不符合Table要求的取值会导致返回值0，符合则返回1
% ------------------------------------
    global Circut OtherVariable
    result = 1;
    Slope = (Circut.Temp(2:(length(Circut.Time)), OtherVariable.NumOfLayer) - Circut.Temp(1:(length(Circut.Time)-1), OtherVariable.NumOfLayer)) / OtherVariable.TimeBreak;
    if max(abs(Slope)) > 3
        result = 0;
        return
    end
    num = sum([0; (Slope >= 0)] & (Circut.Temp(:, OtherVariable.NumOfLayer) >= 150) & (Circut.Temp(:, OtherVariable.NumOfLayer) <= 190));
    num = num * OtherVariable.TimeBreak;
    if num < 60 | num > 120
        result = 0;
        return
    end
    num = sum(Circut.Temp(:, OtherVariable.NumOfLayer) > 217);
    num = num * OtherVariable.TimeBreak;
    if num < 40 | num > 90
        result = 0;
        return
    end
    num = max(Circut.Temp(:, OtherVariable.NumOfLayer));
    if num < 240 | num > 290
        result = 0;
        return
    end
end
    