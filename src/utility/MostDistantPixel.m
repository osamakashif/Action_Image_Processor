function [farr,farg,farb] = MostDistantPixel(rgbarray)
%MOSTDISTANTPIXEL Finds the most distant values of each layer of the
%rgbarray and returns those.
%   It has 1 input: rgbarray - a 1 by n by 3 3D array of RGB values
%   representing a list of pixels.
%   It has 3 outputs:
%   1) farr - the red value of the most distant pixel;
%   2) farg - the green value of the most distant pixel;
%   3) farb - the blue value of the most distant pixel.

%   Author: Osama Kashif

% First make an array containing the median values using the MedianPixel function made
[R,G,B] = MedianPixel(rgbarray);
medianarray = [R,G,B];

% Find the columns of the rgbarray
[~,col,~] = size(rgbarray);
% Make a default max distance value and assign it a negative value
maxd = -1;
% Going through the columns of the rgbarray using a for loop to check the
% pixels
for i = 1:col
    %     Making comparativearray so that it can be used to compare the
    %     distance between the median values and itself using the PixelDistance
    %     function made
    red = rgbarray(:,i,1);
    green = rgbarray(:,i,2);
    blue = rgbarray(:,i,3);
    comparativearray = [red,green,blue];
    %     Distance is stored in the variable d
    d = PixelDistance(medianarray,comparativearray);
    %     Check if distance is the greatest by comparing it to the default max
    %     distance value and updating/replacing it till the end of the for loop, with the final
    %     value being the most distant one
    if d > maxd
        maxd = d;
        %         most_distant_pixel_index assigned the index value to show it is
        %         index for the rgbarray values that have the most distance
        most_distant_pixel_index = i;
    end
end

% Assigning farr,farg, and farb the most distant pixel red, green, and blue
% values respectively using the most_distant_pixel_index
farr = rgbarray(:,most_distant_pixel_index,1);
farg = rgbarray(:,most_distant_pixel_index,2);
farb = rgbarray(:,most_distant_pixel_index,3);

end