function result = CalculateArea()
% ------------------------------------
% 根据已知的全局变量计算得到超过217摄氏度的上升区间面积（为负数），用于主函数的辅助函数
% 在不符合Table要求的取值会导致返回值0
% ------------------------------------
    global OtherVariable Circut
    if CheckCondition
        Data = Circut.Temp(:, OtherVariable.NumOfLayer);
        LocMax = find(Data == max(Data));
        Loc = find(Data >= 217);
        Loc = Loc(find(Loc < LocMax));
        Data = Data(Loc);
        result = OtherVariable.TimeBreak * sum(Data - 217);
    else
        result = 0;
    end
end
    
    