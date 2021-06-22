function [centers,lenOfClasses] = CalculateVirtualCenter(x,c)
%#
%# [centers] = CalculateVirtualCenter(x,c)
%#
%# Input
%# x: Pattern Vectors
%# c: Classes
%# Output
%# centers: the calculated ideal center for each property for each category
%# lenOfClasses: the number of occurences for each class

NumOfClass = max(c) ;
[rownum,colnum]=size(x);

%create the array where we will store the average values
centers = zeros(rownum,NumOfClass);

%add every number of the rows of each case in one cell
for i = 1:rownum
    for j = 1:colnum
        centers(i,c(j)) = centers(i,c(j)) + x(i,j);
    end
end


%get the number of occurences for each class
lenOfClasses = zeros(1,NumOfClass);
for index = 1:NumOfClass
    lenOfClasses(index) = sum(c==index);
end

%divide with each case with the number of occurences to get the average
for index = 1:NumOfClass
    %dont divide if we have 0 occurences
    if lenOfClasses(index) ~= 0        
        centers(:,index) = centers(:,index)./lenOfClasses(index);
    end    
end

