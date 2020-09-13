function result = Error(Data, shift)
% ----------------------------------------
% 返回曲线的所有误差值
% 仅可与输入的数据 Data （附录.csv） 中数据比较
% shift设为0或者不太大的数以统一横坐标
% ----------------------------------------
    global Circut OtherVariable
    now1 = 1;
    now2 = 1;
    result = [];
    num = 0;
    Data(:, 1) = Data(:, 1) - shift;
    while now2 <= size(Data, 1) && now1 <= size(Circut.Time, 1)
        if abs(Circut.Time(now1) - Data(now2, 1)) < 1e-3
            num = num + 1;
            result = [result; Circut.Temp(now1, OtherVariable.NumOfLayer) - Data(now2, 2)];
            now1 = now1 + 1;
            now2 = now2 + 1;
        else
            now1 = now1 + 1;
        end
    end
end