function result = AxisToBreak(x)
% ---------------------
% 定义由坐标向间隙序数的转移函数，用于主函数的辅助函数
% x在不合适的范围内会导致函数返回值0
% ---------------------
    global Break
    result = find(1 == ((Break.Axis(:, 1) < x) & (x < Break.Axis(:, 2))));
end