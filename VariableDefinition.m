%% ��������������Ĳ��ֱ���

%% �û��������
TempOfArea = [182, 182, 182, 182, 182, 203, 237, 254, 254, 25, 25]';    % ����ʮһ���������¶�
RunRate = 70/60;                                                        % ���봫�ʹ��ƶ��ٶ�
TimeBreak = 0.02;                                                       % ������Сʱ����


%% ����ָ������
%% ������������ĺ�����
AxisOfBreak = 55.5 + [0: 9]' * 35.5;
AxisOfBreak = [AxisOfBreak, AxisOfBreak+5];

%% ���������ĺ�����
AxisOfArea = [0:10]' * 55.5 + 25;
AxisOfArea = [AxisOfArea, AxisOfArea + 30.5]��
