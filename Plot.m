%% 提前运行函数 & plot1
Model2;
%% plot 2
subplot(1, 3, 1)
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'r')
hold on
plot(Circut.Time, Circut.EnvirTemp, 'g')
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2), 'b')
xlabel('时间（s）'); ylabel('温度（^oC）')
title('模型结果与实际结果展示')
legend('炉温曲线计算结果', '炉内温度曲线计算结果', '实验结果(result.csv)')

subplot(1, 3, 2)
plot(Data(:, 1), Error(Data, 0));
xlabel('时间（s）'); ylabel('温度（^oC）')
title('模拟值与真实值误差')

subplot(1, 3, 3)
hist(Error(Data, 0))
title('模拟值与真实值误差分布')

