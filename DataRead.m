%% 导入电子表格中的数据
% 用于从以下电子表格导入数据的脚本:
%
%    工作簿: E:\my college\数学建模\A\附件.xlsx
%    工作表: Sheet1
%
% 由 MATLAB 于 2020-09-11 10:55:30 自动生成

%% 设置导入选项
opts = spreadsheetImportOptions("NumVariables", 2);

% 指定工作表和范围
opts.Sheet = "Sheet1";
opts.DataRange = "A2:B709";

% 指定列名称和类型
opts.VariableNames = ["s", "C"];
opts.VariableTypes = ["double", "double"];

% 导入数据
Data = readtable("附件.xlsx", opts, "UseExcel", false);

%% 转换为输出类型
Data = table2array(Data);

%% 清除临时变量
clear  opts