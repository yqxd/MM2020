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
%% 导入数据
DataRead;
%% 质点层数结构温度变化分析
%% 变量命名                         
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);
%% 函数运行
for i = 64:80
    OtherVariable.RunRate = i / 60;
    HeatTransfer2()
    if ~CheckCondition()
        break
    end
end

left = 74.76;
right = 74.88;
while right - left > 0.0001
    mid = (left + right) / 2;
    OtherVariable.RunRate = mid / 60;
    HeatTransfer2()
    if CheckCondition()
        left = mid;
    else
        right = mid;
    end
end
%% 图像绘制1
hold off
Location = find((abs(rem(Circut.Time / 0.5, 1)) < 1e-7) |  (abs(rem(Circut.Time / 0.5, 1) - 1) < 1e-7));    % 从微分结果中选择出所需要的位置
hold on
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'b ')
% text(Circut.Time(Location), result(Location), '+', 'color', 'g')
hold on
plot(Circut.Time, Circut.EnvirTemp, 'r')
hold on
legend('炉内温度',  '炉温曲线');
title('问题一：炉内环境温度曲线与炉温曲线')
%% 图像绘制2 
hold off
plot(Circut.Time, Circut.EnvirTemp, 'r')
hold on
legend('炉温曲线');
title('炉内环境温度曲线示例')%% 图像绘制3
hold off
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'b ')
hold on
legend('炉温曲线');
title('问题一：炉温曲线')