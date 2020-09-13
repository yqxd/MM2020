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
DataRead;
%% ȫ�ֱ�������                         
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);
%% ����õ����Ž�
% tic
% result1 = [];
% result2 = [];
% x = [182; 200; 236; 254; 73];
% count = 10;
% break1 = 5;
% break2 = 1;
% MinV = 100;
% MinX = [182; 200; 236; 254; 73];
% while count > 0
%     for x1 = [x(1) - break1, x(1), x(1) + break1]
%         for x2 = [x(2) - break1, x(2), x(2) + break1]
%             for x3 = [x(3) - break1, x(3), x(3) + break1]
%                 for x4 = [x(4) - break1, x(4), x(4) + break1]
%                     for x5 = [x(5) - break2, x(5), x(5) + break2]
%                         NowV = Question4_Value([x1; x2; x3; x4; x5]);
%                         if NowV < MinV
%                             MinV = NowV;
%                             MinX = [x1; x2; x3; x4; x5];
%                         end
%                         result1 = [result1, [x1; x2; x3; x4; x5; NowV]];
%                     end
%                 end
%             end
%         end
%     end
%     x = MinX;
%     break1 = break1 / 3;
%     break2 = break2 / 3;
%     count = count - 1;
% end
% toc

%%
MinX = [174.5001; 193.1174; 228.5001; 257.4875; 74.4959];
MinV = 0.3856;