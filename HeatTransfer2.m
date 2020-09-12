function HeatTransfer2()
    global Circut OtherVariable
    if(size(Circut.Temp, 2) ~= 1)
        Circut.Temp = zeros(1, OtherVariable.NumOfLayer) + 25;
        Circut.EnvirTemp = [25];
        Circut.Time = [0];
        Circut.Axis = [0];
    end
    t = 0;
    x = 0;
    u = 25;
    tau = OtherVariable.Tau2;
    dt = OtherVariable.TimeBreak;
    dx = dt * OtherVariable.RunRate;
    count = 1;
    while t <= 435.5
        t = t + dt;
        x = x + dx;
        count = count + 1;
        Circut.Temp = [Circut.Temp; zeros(1, OtherVariable.NumOfLayer)];
        Circut.Temp(count, 1) = (AxisToEnvirTemp(x) - Circut.Temp(count - 1, 1)) * OtherVariable.Tau * dt + Circut.Temp(count - 1, 1); 
        for i = 2:OtherVariable.NumOfLayer
            add = (Circut.Temp(count, i-1) - Circut.Temp(count - 1, i)) * tau * OtherVariable.Thick * dt;
            Circut.Temp(count, i) = (Circut.Temp(count, i-1) - Circut.Temp(count - 1, i)) * tau * OtherVariable.Thick * dt + Circut.Temp(count - 1, i);
            Circut.Temp(count, i - 1) = Circut.Temp(count, i - 1);
        end
        Circut.EnvirTemp = [Circut.EnvirTemp, AxisToEnvirTemp(x)];
        Circut.Time = [Circut.Time; t];
        Circut.Axis = [Circut.Axis; x];
    end
end