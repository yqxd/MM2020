function result = CalculateArea()
% ------------------------------------
% ������֪��ȫ�ֱ�������õ�����217���϶�ͼ���ƫ�ȣ������������ĸ�������
% �ڲ�����TableҪ���ȡֵ�ᵼ�·���ֵ100
% ------------------------------------
    global OtherVariable Circut
    if CheckCondition
        Data = Circut.Temp(:, OtherVariable.NumOfLayer);
        Loc = find(Data >= 217);
        Data = Data(Loc);
        result = skewness(Data);
    else
        result = 100;
    end
end