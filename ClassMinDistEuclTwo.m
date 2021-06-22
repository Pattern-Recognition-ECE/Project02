function [Rc,Ru,Rep] = ClassMinDistEuclTwo(x,c)
%#  This is to return correct classifications using examples as centers
%#  [Rc,Ru,Rep] = ClassMinDistEuclOne(x,c)
%#  Pattern Recognition: 
%#      Distance measure:      Euclidian
%#      Prototypes:            One Center
%#      Classification rule:   Minimum Distance
%#
%#  Input
%#      x: Pattern Vectors
%#      c: Classes
%#  Output
%#      Rc: Correct classification rate using the C-method
%#      Ru: Correct classification rate using the U-method
%#      Rep: Pattern vectors on each class
%#

NumOfClass = max(c) ;
[~,NumOfPatterns] = size(x) ;
[centers,~] = FindBestCenterInExamples(x,c);
Rep = zeros(NumOfClass,1) ;

%#
%#  C-Error
%#


Rc = zeros(NumOfClass,1) ;
for i = 1:NumOfPatterns
    for j = 1:NumOfClass
        Dist(j) = (x(:,i) - centers(:,j))' * ( x(:,i) - centers(:,j) ) ;
    end
    Rec = ArgMin(Dist) ;
    if (Rec == c(i))
       Rc(Rec) = Rc(Rec) + 1 ;
    end
end

%#
%#  U-Error
%#

Ru = zeros(NumOfClass,1) ;
for j = 1:NumOfPatterns
    k = c(j) ;
    xRemoved = x;
    xRemoved(:,j) = [];
    cRemoved = c;
    cRemoved(:,j) = [];
    [centers,~] = FindBestCenterInExamples(xRemoved,cRemoved); 
    for i = 1:NumOfClass
        Dist(i) = (x(:,j) - centers(:,i))' * ( x(:,j) - centers(:,i) ) ;
    end
    Rec = ArgMin(Dist) ;
    if (Rec == k)
       Ru(Rec) = Ru(Rec) + 1 ;
    end
end
