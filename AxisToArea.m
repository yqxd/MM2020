function result = AxisToArea(x)
% ---------------------
% ����������������������ת�ƺ���
% x��ȡֵ��Χ��
% 
% ---------------------
    global ReflowOven
    result = find(1 == ((ReflowOven.Axis(:, 1) <= x) & (x <= ReflowOven.Axis(:, 2))));
end