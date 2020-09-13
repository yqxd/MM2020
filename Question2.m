clear all;
clc;
%% �û��������
TempOfArea = [zeros(1, 5) + 182, 203, 237, 254, 254, 25, 25]';    % ����ʮһ���������¶�
RunRate = 78/60;                                                        % ���봫�ʹ��ƶ��ٶ�
TimeBreak = 0.02;                                                       % ������Сʱ����
Tau = 0.021;                                                            % �ȴ���Ч��
Tau2 = 0.41;                                                            % �ȴ���Ч��2�������أ�
Kair = 0.15;                                                            % ������ȴЧ��
Kair2 = 0.02;                                                           % ������ȴЧ��2
NumOfLayer = 7;                                                         % ����
%% ������������ĺ�����
AxisOfBreak = 55.5 + [0: 9]' * 35.5;
AxisOfBreak = [AxisOfBreak, AxisOfBreak+5];
%% ���������ĺ�����
AxisOfArea = [0:10]' * 35.5 + 25;
AxisOfArea = [AxisOfArea, AxisOfArea + 30.5];
%% ����ĳЩ����ϵ��
Zql = 149/(2330*703);
Tau2 = Tau2 * 100000;
%% ����ĳһ��ĺ��
Thick = 1.5e-4/NumOfLayer;
%% ��������
DataRead;
%% �ʵ�����ṹ�¶ȱ仯����
%% ��������                         
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);
%% Ѱ�Ҵ��巶Χ
% for i = 64:80
%     OtherVariable.RunRate = i / 60;
%     HeatTransfer2()
%     if ~CheckCondition()
%         break
%     end
% end
disp('Ѱ�ҵ����ʵĴ��巶Χ��73-75cm/min')
%% Ѱ�Ҿ�ȷ��Χ
% left = 73;
% right = 75;
% while right - left > 0.0001
%     mid = (left + right) / 2;
%     OtherVariable.RunRate = mid / 60;
%     HeatTransfer2()
%     if CheckCondition()
%         left = mid;
%     else
%         right = mid;
%     end
% end
disp('Ѱ�ҵ����ʵľ�ȷ��Χ��74.7744cm/min')
%% ͼ�����1
% hold off
% Location = find((abs(rem(Circut.Time / 0.5, 1)) < 1e-7) |  (abs(rem(Circut.Time / 0.5, 1) - 1) < 1e-7));    % ��΢�ֽ����ѡ�������Ҫ��λ��
% hold on
% plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'b ')
% % text(Circut.Time(Location), result(Location), '+', 'color', 'g')
% hold on
% plot(Circut.Time, Circut.EnvirTemp, 'r')
% hold on
% legend('¯���¶�',  '¯������');
% title('����һ��¯�ڻ����¶�������¯������')
%% ͼ�����2 
% hold off
% plot(Circut.Time, Circut.EnvirTemp, 'r')
% hold on
% legend('¯������');
% title('¯�ڻ����¶�����ʾ��')
%% ͼ�����3
OtherVariable.RunRate = 73.7744 / 60;
HeatTransfer2()
hold off
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'b ')
hold on
legend('¯������');
title('�������¯������')