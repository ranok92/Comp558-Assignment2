function [output] = calcMSE(arg1,arg2)
%UNTITLED2 Summary of this function goes here
%calculates the mean squared error 
sum = 0;
for i = 1:size(arg1,1)
    for j = 1:size(arg1,2)
       sum = sum+(arg1(i,j)-arg2(i,j)).^2; % subracts the corresonding values and squares them
    end
end
output = double(sum/(size(arg1,1)*size(arg1,2)));
end
