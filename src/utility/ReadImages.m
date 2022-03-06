function images = ReadImages(filenames)
%READIMAGES Creates cell array of RGB images from their file names.
%   Takes a file names of images, and returns a cell array of 
%   RGB images to be processed.
%   It has 1 inputs: filenames =  a 1 by n 1D cell array where each
%   element is a filename of an image to read.
%   It has 1 output: images = a 1D array storing 3D arrays of the 
%   RGB values of the images.

%   Author: Osama Kashif

% Looping to go through every entry of the cell array
images = cell(1,length(filenames));
for i = 1:length(filenames)
    %     Converting the cell to a normal array and reading and storing the
    %     data in pictures
    images(i) = {imread(filenames{i})};
end
end
