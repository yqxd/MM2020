%% ������ӱ���е�����
% ���ڴ����µ��ӱ�������ݵĽű�:
%
%    ������: E:\my college\��ѧ��ģ\A\����.xlsx
%    ������: Sheet1
%
% �� MATLAB �� 2020-09-11 10:55:30 �Զ�����

%% ���õ���ѡ��
opts = spreadsheetImportOptions("NumVariables", 2);

% ָ��������ͷ�Χ
opts.Sheet = "Sheet1";
opts.DataRange = "A2:B709";

% ָ�������ƺ�����
opts.VariableNames = ["s", "C"];
opts.VariableTypes = ["double", "double"];

% ��������
Data = readtable("����.xlsx", opts, "UseExcel", false);

%% ת��Ϊ�������
Data = table2array(Data);

%% �����ʱ����
clear  opts