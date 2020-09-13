function result = check(Data, shift, k)
% ----------------------------------------
% 定量检查曲线的拟合程度
% 仅可与输入的数据 Data （附录.csv） 中数据比较
% shift设为0或者不太大的数以统一横坐标
% k选择1或者2以计算误差平均绝对值或者均方误差
% ----------------------------------------
    global Circut OtherVariable
    now1 = 1;
    now2 = 1;
    all = 0;
    num = 0;
    Data(:, 1) = Data(:, 1) - shift;
    while now2 <= size(Data, 1) && now1 <= size(Circut.Time, 1)
        if abs(Circut.Time(now1) - Data(1, now2)) < 1e-4
            num = num + 1;
            if k == 1
                all = all + abs(Circut.Temp(now1, OtherVariable.NumOfLayer) - Data(now2, 2));
            elseif k == 2
                all = all + abs(Circut.Temp(now1, OtherVariable.NumOfLayer) - Data(now2, 2))^2;
            end
            now1 = now1 + 1;
            now2 = now2 + 1;
        else
            now1 = now1 + 1;
        end
    end
    result  = all / num;
end
        
        