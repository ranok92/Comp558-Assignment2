function [diffimg] = centralDiffX(input)
%UNTITLED4 Summary of this function goes here
%   calculates the partial derivative in the x direction
    padImg = [ input(:,1) input input(:,size(input,2))]; %does the padding
    diffimg = zeros(size(input));
    [ row col ] = size(input);
    for r = 1:row
        for c = 2:col+1
            diffimg(r,c-1) = (padImg(r,c+1)-(padImg(r,c-1)))/2; %uses the central difference formula
        end
    end
end

