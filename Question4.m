clear all;
clc;
%% 用户输入变量
TempOfArea = [zeros(1, 5) + 182, 203, 237, 254, 254, 25, 25]';    % 输入十一个温区的温度
RunRate = 78/60;                                                        % 输入传送带移动速度
TimeBreak = 0.02;                                                       % 定义最小时间间隔
Tau = 0.021;                                                            % 热传导效率
Tau2 = 0.41;                                                            % 热传导效率2（厚度相关）
Kair = 0.15;                                                            % 空气冷却效率
Kair2 = 0.02;                                                           % 空气冷却效率2
NumOfLayer = 7;                                                         % 层数
%% 定义温区间隔的横坐标
AxisOfBreak = 55.5 + [0: 9]' * 35.5;
AxisOfBreak = [AxisOfBreak, AxisOfBreak+5];
%% 定义温区的横坐标
AxisOfArea = [0:10]' * 35.5 + 25;
AxisOfArea = [AxisOfArea, AxisOfArea + 30.5];
%% 计算某些可用系数
Zql = 149/(2330*703);
Tau2 = Tau2 * 100000;
%% 计算某一层的厚度
Thick = 1.5e-4/NumOfLayer;
DataRead;
%% 全局变量命名                         
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);
%% 计算得到最优解
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
% csvwrite('MinVQ4.csv', result1, 0, 0)
%% 变量控制与图像绘制1
x = [174.5001; 193.1174; 228.5001; 257.4875; 74.4959];
-Question3_Value(x);
MinV = '0.3856';
hold off
Location = find((abs(rem(Circut.Time / 0.5, 1)) < 1e-7) |  (abs(rem(Circut.Time / 0.5, 1) - 1) < 1e-7));    % 从微分结果中选择出所需要的位置
hold on
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'b ')
% text(Circut.Time(Location), result(Location), '+', 'color', 'g')
hold on
plot(Circut.Time, Circut.EnvirTemp, 'r')
hold on
plot(1:450, 217*ones(1, 450))
Data = Circut.Temp(:, OtherVariable.NumOfLayer);
LocMax = find(Data == max(Data));
plot(zeros(1, 300)+LocMax*OtherVariable.TimeBreak, 1:300)
legend('炉内温度',  '炉温曲线', 'y = 217', ['x = arg max(y), ', num2str(CalculateSkew())]);
title('问题四：炉内环境温度曲线与炉温曲线')
disp('当区间1-5温度为174.5001， 区间6温度为 193.1174， 区间7温度为228.5001， 区间8-9温度为257.4875， 运动速度为74.4959cm/min时，达到最小偏度 0.3856 ')

%% 图像绘制2 
% hold off
% plot(Circut.Time, Circut.EnvirTemp, 'r')
% hold on
% legend('炉温曲线');