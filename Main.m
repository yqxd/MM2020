%% MM2020
clear all; clc;

%% 变量命名
VariableDefinition;                                     % 引用 VariableDefinition.m 文件中的变量
global ReflowOven Circut Break;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea, 'Axis', AxisOfArea);
Circut = struct('Time', [], 'Axis', [], 'Temp', []);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
