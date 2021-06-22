[x,c] = ReadGlass(214);

%Ερώτημα 1
disp("Ερώτημα 1")
[centers,lenOfClasses] = CalculateVirtualCenter(x,c);
disp("Τιμές εικονικού προτύπου:")
disp(centers)

%Ερώτημα 2
disp("Ερώτημα 2")
[Rc,Ru,Rep] = ClassMinDistEuclOne(x,c);
sumRc = 0;
sumRu = 0;
for i = 1:length(Rc)
    sumRc = sumRc + Rc(i);
    sumRu = sumRu + Ru(i);
end
minError = 1-sumRc/length(x);
maxError = 1-sumRu/length(x);
disp("Ελάχιστο σφάλμα του συστήματος ταξινόμησης (μέθοδος C)")
disp(minError)
disp("Μέγιστο σφάλμα του συστήματος ταξινόμησης (μέθοδος U)")
disp(maxError)
    
%Ερώτημα 3
disp("Ερώτημα 3")
[centers2,indexes] = FindBestCenterInExamples(x,c);
disp("Τιμές προτύπου από παραδείγματα:")
disp(centers2)
disp("Θέσεις των ιδανικών παραδειγμάτων για κάθε κατηγορία:")
disp(indexes)

%Ερώτημα 4
disp("Ερώτημα 4")
[Rc,Ru,Rep] = ClassMinDistEuclTwo(x,c);
sumRc = 0;
sumRu = 0;
for i = 1:length(Rc)
    sumRc = sumRc + Rc(i);
    sumRu = sumRu + Ru(i);
end
minError = 1-sumRc/length(x);
maxError = 1-sumRu/length(x);
disp("Ελάχιστο σφάλμα του συστήματος ταξινόμησης (μέθοδος C)")
disp(minError)
disp("Μέγιστο σφάλμα του συστήματος ταξινόμησης (μέθοδος U)")
disp(maxError)

