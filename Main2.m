clear all;
clc;
%% �ʵ�����ṹ�¶ȱ仯����
%% ��������
VariableDefinition;                                     % ���� VariableDefinition.m �ļ��еı���
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);

%% ������ͼ�����
HeatTransfer2()
hold off
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer))
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = -1;
plot(Data(:, 1) - Shift , Data(:, 2))
hold on
plot(Data(2:708, 1) - Shift, 100 * 2 * (Data(2:708, 2)-Data(1:707, 2)))
plot(Circut.Time(2:size(Circut.Time)), (Circut.Temp(2:size(Circut.Time), OtherVariable.NumOfLayer) -Circut.Temp(1:(size(Circut.Time)-1), OtherVariable.NumOfLayer)) / OtherVariable.TimeBreak * 100)
legend('��ײ��¶�',  '�����¶�', '��׼�¶�', '��׼�¶ȵ���', '����¶ȵ���');
check(Data, Shift, 2)