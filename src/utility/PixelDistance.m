function [squared] = PixelDistance(point1rgb,point2rgb)
%PIXELDISTANCE Returns the squared distance between 2 rgb points.
%   It has 2 inputs:
%   1) point1rgb - an array containing three elements representing a point
%   in 3D colour space;
%   2) point2rgb - an array containing three elements representing a second
%   point in 3D colour space.
%   It has 1 output: squared - the square of the distance between the two
%   points in the 3D colour space.

%   Author: Osama Kashif

% Checking if the input is a 1D array  or a 3D array and assign the reults
% to variables 'a' and 'b' to use in conditional statements
TF = ismatrix(point1rgb);
a = TF;
TF = ismatrix(point2rgb);
b = TF;
% Checking if inputs are 1D and/or 3D arrays and using the formula(where D
% is square distance, P is point 1, Q is point 2) D =(P1 - Q1)^2 + (P2 - Q2)^2 + (P3 - Q3)^2
if (a == 1) && (b == 1)
    squared = (double(point1rgb(1))-double(point2rgb(1)))^2 + (double(point1rgb(2))- double(point2rgb(2)))^2 + (double(point1rgb(3))-double(point2rgb(3)))^2;
elseif (a == 1) && (b == 0)
    squared = (double(point1rgb(1))-double(point2rgb(:,:,1)))^2 + (double(point1rgb(1))-double(point2rgb(:,:,2)))^2 + (double(point1rgb(1))-double(point2rgb(:,:,3)))^2;
elseif (a == 0) && (b == 1)
    squared = (double(point1rgb(:,:,1))-double(point2rgb(1)))^2 + (double(point1rgb(:,:,2))-double(point2rgb(1)))^2 + (double(point1rgb(:,:,3))-double(point2rgb(1)))^2;
elseif (a == 0) && (b == 0)
    squared = (double(point1rgb(:,:,1))-double(point2rgb(:,:,1)))^2 + (double(point1rgb(:,:,2))-double(point2rgb(:,:,2)))^2 + (double(point1rgb(:,:,3))-double(point2rgb(:,:,3)))^2;
end
end