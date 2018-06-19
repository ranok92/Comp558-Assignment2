function [newImage] = heatequation(image,deltaT,t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 n = t/deltaT;
 newImage = image;
 figure('Name','Heat diffusion: ')
 for i = 1:n
     newImage = (centralDiffX(centralDiffX(newImage))+centralDiffY(centralDiffY(newImage)))*deltaT+double(newImage); %does the heat diffusion equation calculation
     imshow(uint8(newImage));
     pause(.1);
 end
end

