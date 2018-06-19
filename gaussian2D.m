function [newmat] = gaussian2D(windowsize,mew,sigma)
%UNTITLED2 Summary of this function goes here
%   creates a 2d gaussian of the given size
newmat = zeros(size(windowsize));

r_orig = ceil(windowsize/2);
c_orig = r_orig;
    for r = 1:windowsize
        for c  = 1:windowsize
            dist = sqrt(round((r-r_orig).^2+(c-c_orig).^2));
            gaus_val = (1/(2*pi*(sigma.^2))*(exp(-(dist-mew).^2/(2*(sigma.^2)))));
            newmat(r,c) = gaus_val;
        end
    end
    newmat = newmat./sum(sum(newmat)); % normalizes the result


