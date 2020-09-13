%% ģ�Ͷ�
% ���Ǻ�ȵ��¶ȴ���ģ����ʾ�ļ�
clear all; clc;
%% �û����벿�ֳ���
Temp1_5 = 175;                                          % ����1-5���¶�
Temp6 = 195;                                            % ����6���¶�
Temp7 = 235;                                            % ����7���¶�
Temp8_9 = 255;                                          % ����8-9���¶�
RunRate = 70 / 60;                                      % ���봫�ʹ��ƶ��ٶ�
%% ȫ�ֱ�������
VariableDefinition;                                     % ���� VariableDefinition.m �ļ��еı���
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);
%% ������ͼ�����
HeatTransfer2()
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer))
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2))
xlabel('ʱ�䣨s��'); ylabel('�¶ȣ�^oC��')
title('ģ�Ͷ���ģ�ͽ����ʵ�ʽ��չʾ')
legend('¯�����߼�����', '¯���¶����߼�����', 'ʵ����(result.csv)')
disp('ͨ����Ӻ�������������߾��ȣ���ͼ��ʾ����С');