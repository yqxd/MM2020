%% �ʵ�����ṹ�¶ȱ仯����
%% ��������
VariableDefinition;                                     % ���� VariableDefinition.m �ļ��еı���
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(NumOfLayer, 1) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak, 'Tau', Tau, 'Kair', Kair, 'Zql', Zql, 'NumOfLayer', NumOfLayer);

%% ������ͼ�����
HeatTransfer()
plot(Circut.Time, Circut.Temp)
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2))
plot(Data(2:708, 1) - Shift, 100*(Data(2:708, 2)-Data(1:707, 2)))
if 1 == 0
    hold off
end