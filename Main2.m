clear all;
clc;
%% 质点层数结构温度变化分析
%% 变量命名
VariableDefinition;                                     % 引用 VariableDefinition.m 文件中的变量
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);

%% 计算与图像绘制
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
legend('最底层温度',  '环境温度', '标准温度', '标准温度导数', '最低温度导数');
check(Data, Shift, 2)