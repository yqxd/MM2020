function result = AxisToBreak(x)
% ---------------------
% �������������϶������ת�ƺ����������������ĸ�������
% x�ڲ����ʵķ�Χ�ڻᵼ�º�������ֵ0
% ---------------------
    global Break
    result = find(1 == ((Break.Axis(:, 1) < x) & (x < Break.Axis(:, 2))));
end