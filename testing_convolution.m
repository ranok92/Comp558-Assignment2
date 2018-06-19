function [output recovered] = testing_convolution(window_size ,mew, sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

img = imread('mit.jpg');
imgbw = rgb2gray(img);

%imshow(imgbw);
%create the gaussian 
gauss_2D = gaussian2D(window_size,mew,sigma);


surf(gauss_2D);
title('Surface plot of a gaussian')
%do the convolution
output = convolve(gauss_2D,imgbw);

[imgr imgc] = size(imgbw);
%take the new gaussian for the fourier transform
gauss_2D_f = gaussian2D(imgr,mew,sigma);
% do the convolution using FFT
recovered =  ifftshift(ifft2(fft2(imgbw).*fft2((gauss_2D_f))));

figure('Name','Image blurring using spatial convolution');

imshow(uint8(output));
figure('Name','Image blurring using fourier transform');
imshow(uint8(recovered));
disp('Mse between spatial convolution and convolution using FT')
disp(calcMSE(output,recovered));
figure('Name','Difference between spatial convolution and convolution using FT')
imshow(uint8(abs(output-recovered)));
end

