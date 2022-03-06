function [rgbimage] = ActionShot(imgcellarray)
%ACTIONSHOT Returns an image with the action shot of the images from the
%cell array of images input.
%   It has 1 inputs: imgcellarray - a 1 by n 1D cell array containing n
%   images, where each element is an RGB image.
%   It has 1 output: rgbimage - an RGB image stored as 3D arrays of uint8
%   values.

%   Author: Osama Kashif

% Convert the first cell from imgcellarray from a cell array to a 3D array
% to obtain the dimensions
a = imgcellarray{1};
[row,col,layer] = size(a);
% Initialise arrays with zeroes for values so that the processing time is
% faster
rgbimgdouble = zeros(row,col,layer);
concatenatedimages = cat(2, imgcellarray{:});
redrange = concatenatedimages(:,:,1);
greenrange = concatenatedimages(:,:,2);
bluerange = concatenatedimages(:,:,3);
pixelvalues = zeros(1,length(imgcellarray),layer);
% Loop for each row and column of each picture, i.e. loop and process
% for every pixel of each of the images
for i = 1:row
    for j = 1:col
        pixelvalues(1,:,1) = redrange(i,j:col:(col*length(imgcellarray)));
        pixelvalues(1,:,2) = greenrange(i,j:col:(col*length(imgcellarray)));
        pixelvalues(1,:,3) = bluerange(i,j:col:(col*length(imgcellarray)));
        %   The MostDistantPixel function made is used to find the pixel
        %   value with the highest deviation from the median for the range
        %   of values from the different images
        [farr,farg,farb] = MostDistantPixel(pixelvalues);
        %   The highest deviation values are assigned to each of the pixels
        %   of the final image
        rgbimgdouble(i,j,1) = farr;
        rgbimgdouble(i,j,2) = farg;
        rgbimgdouble(i,j,3) = farb;
    end
end
% Convert the double values of the rgbdoubleimage to uint8 to store in the
% rgbimage array
rgbimage = uint8(rgbimgdouble);

end