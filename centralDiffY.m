function [diffimg] = centralDiffY(input)
%UNTITLED5 Summary of this function goes here
%   %   calculates the partial derivative in the y direction

    padImg = [ input(1,:); input ; input(size(input,1),:)];%does the padding
    diffimg = zeros(size(input));
    [ row col ] = size(input);
    for r = 2:row+1
        for c = 1:col
            diffimg(r-1,c) = (padImg(r+1,c)-(padImg(r-1,c)))/2;%uses the central difference formula
        end
    end
end
