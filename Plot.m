%% ��ǰ���к��� & plot1
Model2;
%% plot 2
subplot(1, 3, 1)
plot(Circut.Time, Circut.Temp(:, OtherVariable.NumOfLayer), 'r')
hold on
plot(Circut.Time, Circut.EnvirTemp, 'g')
hold on
Shift = 0;
plot(Data(:, 1) - Shift , Data(:, 2), 'b')
xlabel('ʱ�䣨s��'); ylabel('�¶ȣ�^oC��')
title('ģ�ͽ����ʵ�ʽ��չʾ')
legend('¯�����߼�����', '¯���¶����߼�����', 'ʵ����(result.csv)')

subplot(1, 3, 2)
plot(Data(:, 1), Error(Data, 0));
xlabel('ʱ�䣨s��'); ylabel('�¶ȣ�^oC��')
title('ģ��ֵ����ʵֵ���')

subplot(1, 3, 3)
hist(Error(Data, 0))
title('ģ��ֵ����ʵֵ���ֲ�')

