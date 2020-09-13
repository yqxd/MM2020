function result = CalculateArea()
% ------------------------------------
% 根据已知的全局变量计算得到超过217摄氏度图像的偏度，用于主函数的辅助函数
% 在不符合Table要求的取值会导致返回值100
% ------------------------------------
    global OtherVariable Circut
    if CheckCondition
        Data = Circut.Temp(:, OtherVariable.NumOfLayer);
        Loc = find(Data >= 217);
        Data = Data(Loc);
        result = skewness(Data);
    else
        result = 100;
    end
end