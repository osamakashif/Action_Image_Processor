function [midr,midg,midb] = MedianPixel(rgbarray)
%MEDIANPIXEL Finds the median values of each layer of the rgbarray and
%returns the medians for each layer.
%   It has 1 input: rgbarray - a 1 by n by 3 3D array of RGB values
%   representing a list of pixels.
%   It has 3 outputs:
%   1) midr - the median red value;
%   2) midg - the median green value;
%   3) midb - the median blue value.

%   Author: Osama Kashif

% Find the median value for each colour and round it to the nearest integer
% (as uint8 values used for colours have to be integers) and store in the
% respective variables
midr = round(median(rgbarray(:,:,1)));
midg = round(median(rgbarray(:,:,2)));
midb = round(median(rgbarray(:,:,3)));

end