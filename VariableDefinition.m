%% ��������������Ĳ��ֱ���

%% �û��������
TempOfArea = [zeros(1, 5) + 175, 195, 235, 255, 255, 25, 25]';    % ����ʮһ���������¶�
RunRate = 70/60;                                                        % ���봫�ʹ��ƶ��ٶ�
TimeBreak = 0.02;                                                       % ������Сʱ����
Tau = 0.021;                                                            % �ȴ���Ч��
Tau2 = 0.41;                                                            % �ȴ���Ч��2�������أ�
Kair = 0.15;                                                            % ������ȴЧ��
Kair2 = 0.02;                                                           % ������ȴЧ��2
NumOfLayer = 7;                                                         % ����
%% ����ָ������
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
