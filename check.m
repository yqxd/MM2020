function result = check(Data, k)
    global Circut OtherVariable
    now1 = 1;
    now2 = 1;
    all = 0;
    num = 0;
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
        
        