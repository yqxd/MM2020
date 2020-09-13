function result = AxisToArea(x)
% ---------------------
% 定义由坐标向温区序数的转移函数，用于主函数的辅助函数
% x在不合适的范围内会导致函数返回值0
% ---------------------
    global ReflowOven
    result = find(1 == ((ReflowOven.Axis(:, 1) <= x) & (x <= ReflowOven.Axis(:, 2))));
end