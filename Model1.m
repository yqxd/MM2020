%% 模型一
% 不考虑厚度的温度传导模型演示文件
clear all; clc;
%% 用户输入部分常量
Temp1_5 = 175;                                          % 温区1-5的温度
Temp6 = 195;                                            % 温区6的温度
Temp7 = 235;                                            % 温区7的温度
Temp8_9 = 255;                                          % 温区8-9的温度
RunRate = 70 / 60;                                      % 输入传送带移动速度
%% 全局变量命名
VariableDefinition;                                     % 引用 VariableDefinition.m 文件中的变量，内部含模型默认变量，不建议改动
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);       % 回焊炉温区参数信息
Circut = struct('Time', [0], 'Axis', [0], 'Temp', [25], 'EnvirTemp', [25]);     % 电路板参数与结果信息
Break = struct('Temp', [], 'Axis', AxisOfBreak);                                % 回焊炉温区间隔参数信息
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak, 'Tau', Tau, 'Kair', Kair, 'Zql', Zql, 'NumOfLayer', NumOfLayer, 'Kair2', Kair2); % 其他可用变量（模型默认）
%% 计算与图像绘制
HeatTransfer()
plot(Circut.Time, Circut.Temp)
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2))
xlabel('时间（s）'); ylabel('温度（^oC）')
title('模型一：模型结果与实际结果展示')
legend('炉温曲线计算结果', '炉内温度曲线计算结果', '实验结果(result.csv)')
disp('如图所示显示误差较大，因此通过添加焊接区域厚度以提高精度');