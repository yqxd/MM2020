function result = CalculateArea()
% ------------------------------------
% ������֪��ȫ�ֱ�������õ�����217���϶ȵ��������������Ϊ�������������������ĸ�������
% �ڲ�����TableҪ���ȡֵ�ᵼ�·���ֵ0
% ------------------------------------
    global OtherVariable Circut
    if CheckCondition
        Data = Circut.Temp(:, OtherVariable.NumOfLayer);
        LocMax = find(Data == max(Data));
        Loc = find(Data >= 217);
        Loc = Loc(find(Loc < LocMax));
        Data = Data(Loc);
        result = OtherVariable.TimeBreak * sum(Data - 217);
    else
        result = 0;
    end
end
    
    