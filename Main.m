%% MM2020
clear all; clc;

%% ��������
VariableDefinition;                                     % ���� VariableDefinition.m �ļ��еı���
global ReflowOven Circut Break;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea, 'Axis', AxisOfArea);
Circut = struct('Time', [], 'Axis', [], 'Temp', []);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
