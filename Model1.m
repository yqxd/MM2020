%% ģ��һ
% �����Ǻ�ȵ��¶ȴ���ģ����ʾ�ļ�
clear all; clc;
%% �û����벿�ֳ���
Temp1_5 = 175;                                          % ����1-5���¶�
Temp6 = 195;                                            % ����6���¶�
Temp7 = 235;                                            % ����7���¶�
Temp8_9 = 255;                                          % ����8-9���¶�
RunRate = 70 / 60;                                      % ���봫�ʹ��ƶ��ٶ�
%% ȫ�ֱ�������
VariableDefinition;                                     % ���� VariableDefinition.m �ļ��еı������ڲ���ģ��Ĭ�ϱ�����������Ķ�
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);       % �غ�¯����������Ϣ
Circut = struct('Time', [0], 'Axis', [0], 'Temp', [25], 'EnvirTemp', [25]);     % ��·�����������Ϣ
Break = struct('Temp', [], 'Axis', AxisOfBreak);                                % �غ�¯�������������Ϣ
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak, 'Tau', Tau, 'Kair', Kair, 'Zql', Zql, 'NumOfLayer', NumOfLayer, 'Kair2', Kair2); % �������ñ�����ģ��Ĭ�ϣ�
%% ������ͼ�����
HeatTransfer()
plot(Circut.Time, Circut.Temp)
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2))
xlabel('ʱ�䣨s��'); ylabel('�¶ȣ�^oC��')
title('ģ��һ��ģ�ͽ����ʵ�ʽ��չʾ')
legend('¯�����߼�����', '¯���¶����߼�����', 'ʵ����(result.csv)')
disp('��ͼ��ʾ��ʾ���ϴ����ͨ����Ӻ�������������߾���');