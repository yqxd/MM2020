function result = Question4_Value(x)
% --------------------------------------
% ������������
% ��������Ҫ�ı������ģ���Լ�ģ�������¶����ߵ�ƫ��
% ������Table1��x��ʹ�÷���ֵΪ100
% --------------------------------------
    global OtherVariable ReflowOven
    ReflowOven.Temp(1:5) = [zeros(5, 1)] + x(1);
    ReflowOven.Temp(6) = x(2);
    ReflowOven.Temp(7) = x(3);
    ReflowOven.Temp(8:9) = [x(4); x(4)];
    OtherVariable.RunRate = x(5)/60;
    HeatTransfer2();
    result = abs(CalculateSkew());
end