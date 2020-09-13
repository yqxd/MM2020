function result = AxisToEnvirTemp(x)
% ------------------------------------
% ���ݶ�Ӧ�ĺ��������õ���Ӧ����λ�õ��¶ȣ������������ĸ�������
% x Ϊ������ĺ�����
% �ڹ�����С��ȡֵ��Χ�ᵼ�º�������ֵ25
% ------------------------------------
    global ReflowOven Break OtherVariable
    if x < 0
        result = 25;
    elseif x <= 15
        result = 25;
    elseif x <= 197
        result = (-(ReflowOven.Temp(5)-25)*exp((15-x)*OtherVariable.Kair)) + ReflowOven.Temp(5);
    elseif x >= 339.5
        result = 25 + (ReflowOven.Temp(8) - 25) * exp(-OtherVariable.Kair2*(x - 339.5));
    elseif size(AxisToBreak(x), 1) == 1
        Count = AxisToBreak(x);
        result = (ReflowOven.Temp(Count + 1) * (x - Break.Axis(Count, 1)) + ReflowOven.Temp(Count) * (Break.Axis(Count, 2) - x)) / 5; 
    elseif size(AxisToArea(x), 1) == 1
        Count = AxisToArea(x);
        result = ReflowOven.Temp(Count);
    end
end