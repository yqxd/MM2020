%% ��������
% --------------------------------------------
% ��������¶�����Ͷ�Ӧ�¶�
% �Ż���ͽ�ֵ�洢�ڱ��� x �� val ��
% ����Ϊ����
% --------------------------------------------
%% ������ֵ
A = [];
b = [];

%% ��������������µķ������Ż���
options = optimset()
[x val] = fmincon(@(x) Question3_Value(x), [182; 203; 237; 254; 73], A, b, [], [], zeros(9, 1), [], @Question3_Con, options)