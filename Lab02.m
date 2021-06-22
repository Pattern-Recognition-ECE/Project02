[x,c] = ReadGlass(214);

%������� 1
disp("������� 1")
[centers,lenOfClasses] = CalculateVirtualCenter(x,c);
disp("����� ��������� ��������:")
disp(centers)

%������� 2
disp("������� 2")
[Rc,Ru,Rep] = ClassMinDistEuclOne(x,c);
sumRc = 0;
sumRu = 0;
for i = 1:length(Rc)
    sumRc = sumRc + Rc(i);
    sumRu = sumRu + Ru(i);
end
minError = 1-sumRc/length(x);
maxError = 1-sumRu/length(x);
disp("�������� ������ ��� ���������� ����������� (������� C)")
disp(minError)
disp("������� ������ ��� ���������� ����������� (������� U)")
disp(maxError)
    
%������� 3
disp("������� 3")
[centers2,indexes] = FindBestCenterInExamples(x,c);
disp("����� �������� ��� ������������:")
disp(centers2)
disp("������ ��� �������� ������������� ��� ���� ���������:")
disp(indexes)

%������� 4
disp("������� 4")
[Rc,Ru,Rep] = ClassMinDistEuclTwo(x,c);
sumRc = 0;
sumRu = 0;
for i = 1:length(Rc)
    sumRc = sumRc + Rc(i);
    sumRu = sumRu + Ru(i);
end
minError = 1-sumRc/length(x);
maxError = 1-sumRu/length(x);
disp("�������� ������ ��� ���������� ����������� (������� C)")
disp(minError)
disp("������� ������ ��� ���������� ����������� (������� U)")
disp(maxError)

