function result = AxisToBreak(x)
% ---------------------
% �������������϶������ת�ƺ���
% x��ȡֵ��Χ��
% ---------------------
    global Break
    result = find(1 == ((Break.Axis(:, 1) < x) & (x < Break.Axis(:, 2))));
end