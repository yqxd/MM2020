%% 定义主函数所需的部分变量

%% 以下变量可根据实际情况适当修改
%% 模型默认变量设置
TimeBreak = 0.02;                                                       % 定义最小时间间隔
Tau = 0.021;                                                            % 热传导效率
Tau2 = 0.41;                                                            % 热传导效率2（厚度相关）
Kair = 0.15;                                                            % 空气冷却效率
Kair2 = 0.02;                                                           % 空气冷却效率2
NumOfLayer = 7;                                                         % 层数

%% 以下为根据模型默认变量所计算得到的部分推导值
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

%% 导入结果数据
DataRead;

%% 根据
%% 输入部分常量
TempOfArea = [zeros(1, 5) + Temp1_5, Temp6, Temp7, Temp8_9, Temp8_9, 25, 25]';          % 输入十一个温区的温度