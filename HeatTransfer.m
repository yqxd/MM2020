function HeatTransfer()
% ------------------------------------
% 根据已知的全局变量计算得到模型的所有需要信息
% 模型一主函数
% ------------------------------------
    global Circut OtherVariable
    if(size(Circut.Temp, 1) ~= 1)
        Circut.Temp = [25];
        Circut.EnvirTemp = [25];
        Circut.Time = [0];
        Circut.Axis = [0];
    end
    t = 0;
    x = 0;
    u = 25;
    tau = OtherVariable.Tau;
    dt = OtherVariable.TimeBreak;
    dx = dt * OtherVariable.RunRate;
    count = 1;
    while t <= 410.5
        du = (AxisToEnvirTemp(x) - Circut.Temp(count))*tau*dt;
        u = u + du;
        t = t + dt;
        x = x + dx;
        count = count + 1;
        Circut.EnvirTemp = [Circut.EnvirTemp, AxisToEnvirTemp(x)];
        Circut.Temp = [Circut.Temp; u];
        Circut.Time = [Circut.Time; t];
        Circut.Axis = [Circut.Axis; x];
    end
end