function result = AxisToArea(x)
% ---------------------
% 定义由坐标向温区序数的转移函数
% x的取值范围是
% 
% ---------------------
    global ReflowOven
    result = find(1 == ((ReflowOven.Axis(:, 1) <= x) & (x <= ReflowOven.Axis(:, 2))));
end