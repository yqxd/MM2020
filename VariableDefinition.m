%% 定义主函数所需的部分变量

%% 用户输入变量
TempOfArea = [182, 182, 182, 182, 182, 203, 237, 254, 254, 25, 25]';    % 输入十一个温区的温度
RunRate = 70/60;                                                        % 输入传送带移动速度
TimeBreak = 0.02;                                                       % 定义最小时间间隔


%% 问题指定变量
%% 定义温区间隔的横坐标
AxisOfBreak = 55.5 + [0: 9]' * 35.5;
AxisOfBreak = [AxisOfBreak, AxisOfBreak+5];

%% 定义温区的横坐标
AxisOfArea = [0:10]' * 55.5 + 25;
AxisOfArea = [AxisOfArea, AxisOfArea + 30.5]；
