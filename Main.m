%% MM2020
clear all; clc;


%% 质点单元温度变化分析
%% 变量命名
VariableDefinition;                                     % 引用 VariableDefinition.m 文件中的变量
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', [25], 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak, 'Tau', Tau, 'Kair', Kair, 'Zql', Zql, 'NumOfLayer', NumOfLayer);
%% 计算与图像绘制
HeatTransfer()
plot(Circut.Time, Circut.Temp)
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2))
plot(Data(2:708, 1) - Shift, 100*(Data(2:708, 2)-Data(1:707, 2)))
if 1 == 0
    hold off
end

%% 质点单元温度变化分析
%%
ariableDefinition;                                     % 引用 VariableDefinition.m 文件中的变量
global ReflowOven Circut Break OtherVariable;
ReflowOven = struct('Time', [],  'Axis', AxisOfArea, 'Temp', TempOfArea);
Circut = struct('Time', [0], 'Axis', [0], 'Temp', [25], 'EnvirTemp', [25]);
Break = struct('Temp', [], 'Axis', AxisOfBreak);
OtherVariable = struct('RunRate', RunRate, 'TimeBreak', TimeBreak, 'Tau', Tau, 'Kair', Kair, 'Zql', Zql, 'NumOfLayer', NumOfLayer);


%% 计算与图像绘制
HeatTransfer()
plot(Circut.Time, Circut.Temp)
hold on
plot(Circut.Time, Circut.EnvirTemp)
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2))
plot(Data(2:708, 1) - Shift, 100*(Data(2:708, 2)-Data(1:707, 2)))
if 1 == 0
    hold off
end
%%
if 1==0
x = [1:1000]/10;
result = [];
for i = x
    result = [result; TimeToTemp(i)];
end
plot(x, result)
end
%%
if 1 == 0
global result
M = 1:30;   % / 200
N = 1:300;  % / 1
result = zeros(size(M, 2)+1, size(N, 2)+1);

for X = [0, M]
    result(X+1, 1) = 25;
end

for Y = [0, N]
    result(1, Y+1) = AxisToEnvirTemp(OtherVariable.RunRate * Y);
end
        
for Y = N
    for X = M
        x = X/200/1000;
        y = Y;
        KLWSGD(x, y, X, Y);
    end
end

[x y] = meshgrid([0, M]/200/1000, [0, N])
mesh(x, y, result')
xlabel('x'),ylabel('y'),zlabel('z')
end