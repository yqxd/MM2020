function result = AxisToArea(x)
% ---------------------
% ����������������������ת�ƺ����������������ĸ�������
% x�ڲ����ʵķ�Χ�ڻᵼ�º�������ֵ0
% ---------------------
    global ReflowOven
    result = find(1 == ((ReflowOven.Axis(:, 1) <= x) & (x <= ReflowOven.Axis(:, 2))));
end