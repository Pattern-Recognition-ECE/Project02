function [x,c] = ReadGlass(Tot)
%#
%# [x,c] = ReadGlass(Tot)
%# Read the Glass database stored in the file "glass.data"
%# Input:
%# Tot: Number of Patterns
%# Output:
%# x: Patterns matrix
%# c: Classes integer
if  Tot > 214
    Tot = 214 ;
end
f1 = fopen( 'glass.data', 'r' ) ;
x = zeros(9,Tot);
c = zeros(1,Tot);
for j = 1:Tot
    %this is to get rid of the first element
    %which just keeps track of the number of the element
    b = fscanf( f1, '%d', 1 ) ;
    for i = 1:9
        x(i,j) = fscanf( f1, '%f', 1 ) ;
    end
    %this gets the last element which is the quality of the glass
    c(1,j) = fscanf( f1, '%d', 1 ) ;
end
fclose(f1) ;