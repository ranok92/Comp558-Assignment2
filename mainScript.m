close all;
img = imread('mit.jpg');
imgbw = rgb2gray(img);
[ spatial_conv ft_conv ] = testing_convolution(17,0,4);

[ heatimage ] = heatequation(imgbw,.1,8);

disp('MSE between spatial conv and convolution using heat equation');
disp(calcMSE(spatial_conv,heatimage));
disp('MSE between convolution using fourier and convolution using heat equation');
disp(calcMSE(ft_conv,heatimage));
