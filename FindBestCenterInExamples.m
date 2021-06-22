function [centers,indexes] = FindBestCenterInExamples(x,c)
%#
%# [centers] = CalculateVirtualCenter(x,c)
%#
%# Input
%# x: Pattern Vectors
%# c: Classes
%# Output
%# centers: the center (taken from the examples) for each category
%# indexes: the position in x where we find the best example

NumOfClass = max(c) ;
[rownum,colnum]=size(x);

%get the number of occurences for each class
lenOfClasses = zeros(1,NumOfClass);
for index = 1:NumOfClass
    lenOfClasses(index) = sum(c==index);
end

%this is so we know where each category starts and ends
startFlags = zeros(NumOfClass+1,1);
%first element always starts at 1
startFlags(1) = 1;
for i = 2:NumOfClass+1
   startFlags(i) = startFlags(i-1) + lenOfClasses(i-1);
end

%this is where we store the minimum distance for each category
minDistance = zeros(NumOfClass,1);

%find the indexes where we have the minimum distance from each example of
%each category
indexes = zeros(NumOfClass,1);
for i=1:colnum
    distance = 0;
    for j=startFlags(c(i)):startFlags(c(i)+1)-1
        distance = distance + (x(:,i) - x(:,j))' * (x(:,i) - x(:,j));
        
    end
    %if you find an example with less distance from the other examples in
    %this category update the best example and the minimum distance
    if minDistance(c(i),1) > distance || minDistance(c(i),1) == 0
        indexes(c(i),1) = i;
        minDistance(c(i),1) = distance;
    end
    
end

%set the centers while ignoring the non existant category 4
centers = zeros(rownum, NumOfClass);
for i = 1:NumOfClass
    if i ~= 4
        centers(:,i) = x(:,indexes(i,1));
    end
end






