%% ��������������Ĳ��ֱ���

%% �û��������
TempOfArea = [175, 175, 175, 175, 175, 195, 235, 255, 255, 25, 25]';    % ����ʮһ���������¶�
RunRate = 70/60;                                                        % ���봫�ʹ��ƶ��ٶ�
TimeBreak = 0.005;                                                       % ������Сʱ����
Tau = 0.02;
Kair = 0.02;

%% ����ָ������
%% ������������ĺ�����
AxisOfBreak = 55.5 + [0: 9]' * 35.5;
AxisOfBreak = [AxisOfBreak, AxisOfBreak+5];

%% ���������ĺ�����
AxisOfArea = [0:10]' * 35.5 + 25;
AxisOfArea = [AxisOfArea, AxisOfArea + 30.5];

%% ����ĳЩ����ϵ��


%% ��������
DataRead;
