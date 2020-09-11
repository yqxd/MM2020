function result = AxisToBreak(x)
% ---------------------
% 定义由坐标向间隙序数的转移函数
% x的取值范围是
% ---------------------
    global Break
    result = find(1 == ((Break.Axis(:, 1) < x) & (x < Break.Axis(:, 2))));
end