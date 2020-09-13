function result = CalculateArea()
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