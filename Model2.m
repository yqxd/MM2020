%% 模型二
% 考虑厚度的温度传导模型演示文件
clear all; clc;
%% 用户输入部分常量
Temp1_5 = 175;                                          % 温区1-5的温度
Temp6 = 195;                                            % 温区6的温度
Temp7 = 235;                                            % 温区7的温度
Temp8_9 = 255;                                          % 温区8-9的温度
RunRate = 70 / 60;                                      % 输入传送带移动速度
%% 全局变量命名
VariableDefinition;                                     % 引用 VariableDefinition.m 文件中的变量
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', zeros(1, NumOfLayer) + 25, 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak,'Tau', Tau, 'Tau2', Tau2, 'NumOfLayer', NumOfLayer, 'Thick', Thick, 'Kair', Kair, 'Kair2', Kair2);
%% 计算与图像绘制
HeatTransfer2()
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer))
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2))
xlabel('时间（s）'); ylabel('温度（^oC）')
title('模型二：模型结果与实际结果展示')
legend('炉温曲线计算结果', '炉内温度曲线计算结果', '实验结果(result.csv)')
disp('通过添加焊接区域厚度以提高精度，如图所示误差较小');