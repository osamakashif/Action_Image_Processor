function [rgbimage] = RemoveAction(imgcellarray)
%REMOVEACTION Returns an image with the action removed from the cell array
%of images input.
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
concatenatedimages = cat(2, imgcellarray{:});
redrange = concatenatedimages(:,:,1);
greenrange = concatenatedimages(:,:,2);
bluerange = concatenatedimages(:,:,3);
redlist = redrange(:);
greenlist = greenrange(:);
bluelist = bluerange(:);
pixelvalues(1,length(imgcellarray),3) = zeros();
rough = zeros((length(redlist)/length(imgcellarray)),1);

% Loop for each row and column of each image, i.e. loop and process
% for every pixel of each of the images
for i = 1:(length(redlist)/length(imgcellarray))
     pixelvalues(1,:,1) = redlist(i:(row * col):(row * col * (length(imgcellarray))));
     pixelvalues(1,:,2) = greenlist(i:(row * col):(row * col * (length(imgcellarray))));
     pixelvalues(1,:,3) = bluelist(i:(row * col):(row * col * (length(imgcellarray))));
     [rough(i,1,1),rough(i,1,2),rough(i,1,3)] = MedianPixel(pixelvalues);
end
rgbimgdouble = reshape(rough, row, col, layer);
% Convert the double values of the rgbdoubleimage to uint8 to store in the
% rgbimage array
rgbimage = uint8(rgbimgdouble);

end