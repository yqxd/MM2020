%% 程序描述
% --------------------------------------------
% 求解商品分配的优化解值
% 优化解和解值存储在变量 x 和 val 中
% 仅作为案例
% --------------------------------------------
clear all;
clc;

%% 主函数定义
f = @(x, price) -sum(x.*price);

%% 变量赋值
price = [5; 4; 7; 16; 8; 9; 12; 10; 11];
allocate_matrix = zeros(9, 1);
allocate_matrix(1) = 1000;
allocate_matrix(5) = 1500;
allocate_matrix(9) = 1500;
allocate_matrix(7) = 500;
A = [1     1     1     0     0     0     0     0     0
     0     0     0     1     1     1     0     0     0
     0     0     0     0     0     0     1     1     1];
b = [1000; 1500; 2000];

%% 获得在限制条件下的非线性优化解
[x val] = fmincon(@(x) f(x, price), allocate_matrix, A, b, [], [], zeros(9, 1), [], @NonlconExample)