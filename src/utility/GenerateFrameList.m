function frames = GenerateFrameList(beginning,step,number)
%GENERATEFRAMELIST Generates a cell array of the frame numbers using a
%starting frame, steps and the number of frames desired.
%   It has 3 inputs:
%   1) beginning - the beginning/starting frame number;
%   2) step - step size;
%   3) number - the number of frames to generate.
%   It has 1 output: frames - frame numbers which are in a 1 by n 1D Array.

%   Author: Osama Kashif

% Initialising the frames array by assigning the first value of i to it.
frames = beginning;

% The for loop forms the array for frames by adding the remaining n-1 terms
% to it.
for i = 1:number-1
    frames(i+1) = frames(i) + step;
end
end