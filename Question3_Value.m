function result = Question3_Value(x)
% --------------------------------------
% 问题三主函数
% 根据所需要的变量求得模型以及模型所得温度曲线的面积
% 不符合Table1的x会使得返回值为0
% --------------------------------------
    global OtherVariable ReflowOven
    ReflowOven.Temp(1:5) = [zeros(5, 1)] + x(1);
    ReflowOven.Temp(6) = x(2);
    ReflowOven.Temp(7) = x(3);
    ReflowOven.Temp(8:9) = [x(4); x(4)];
    OtherVariable.RunRate = x(5)/60;
    HeatTransfer2();
    result = -CalculateArea();
end