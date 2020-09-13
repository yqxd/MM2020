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
%% ��������
for i = 64:80
    OtherVariable.RunRate = i / 60;
    HeatTransfer2()
    if ~CheckCondition()
        result = 0;
    else
        result = CalculateArea();
    end
end






%% ��������
tic
result1 = [];
result2 = [];
x = [182; 200; 236; 254; 73];
count = 10;
break1 = 5;
break2 = 1;
MinV = 100000;
MinX = [182; 200; 236; 254; 73];
while count > 0
    for x1 = [x(1) - break1, x(1), x(1) + break1]
        for x2 = [x(2) - break1, x(2), x(2) + break1]
            for x3 = [x(3) - break1, x(3), x(3) + break1]
                for x4 = [x(4) - break1, x(4), x(4) + break1]
                    for x5 = [x(5) - break2, x(5), x(5) + break2]
                        NowV = -Question3_Value([x1; x2; x3; x4; x5]);
                        if (NowV ~= 0) & (NowV < MinV)
                            MinV = NowV;
                            MinX = [x1; x2; x3; x4; x5];
                        end
                        result1 = [result1, [x1; x2; x3; x4; x5; NowV]];
                    end
                end
            end
        end
    end
    x = MinX;
    break1 = break1 / 3;
    break2 = break2 / 3;
    count = count - 1;
end
toc





%% ����������ͼ�����1
x = [182; 200; 236; 254; 73];
Question3_Value(x)
hold off
Location = find((abs(rem(Circut.Time / 0.5, 1)) < 1e-7) |  (abs(rem(Circut.Time / 0.5, 1) - 1) < 1e-7));    % ��΢�ֽ����ѡ�������Ҫ��λ��
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
legend('¯���¶�',  '¯������', 'y = 217', ['x = arg max(y), ', num2str(CalculateArea())]);
title('��������¯�ڻ����¶�������¯������')

%% ͼ�����2 
hold off
plot(Circut.Time, Circut.EnvirTemp, 'r')
hold on
legend('¯������');
title('¯�ڻ����¶�����ʾ��')%% ͼ�����3
hold off
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'b ')
hold on
legend('¯������');
title('��������¯������')