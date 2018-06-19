function [conv_img] = convolve(convwindow,image)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


[row,col] = size(image);
[conv_r,conv_c] = size(convwindow);


start_row = ceil(conv_r/2);
start_col = start_row;
end_row = row+conv_r - 1 - start_row+1;
end_col = end_row;

paddedimg = zeros(row+conv_r-1);

%the padding part
paddedimg = double(padarray(image,[floor(size(convwindow,1)/2) floor(size(convwindow,2)/2)],'symmetric'));


conv_img = zeros(size(row));
testcounter = 1;
normalizing_factor = sum(sum(convwindow));
count_r = 1;
count_c = 1;
%the main convoulution part
for r = start_row:end_row
    for c = start_col:end_col
        sum_val = 0;
        for i = 1:conv_r
            for j = 1:conv_c
               sum_val = sum_val+(convwindow(conv_r-i+1,conv_c-j+1)*paddedimg(r-start_row+i,c-start_col+j)); %here reflection is also taken into account while doing the convolution
              
            end
        end
        conv_img(count_r,count_c) = sum_val;
        count_c = count_c+1;
    end
    testcounter = testcounter+1;
    count_r = count_r+1;
    count_c = 1;
end

end

