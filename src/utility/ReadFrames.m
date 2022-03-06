function [frames] = ReadFrames(fileName,frameNumbers)
%READFRAMES Creates cell array of RGB images of video frames.
%   Takes a file name of a video and a 1D array of frames to fetch, 
%   and returns a cell array of RGB images to be processed.

%   Author: Osama Kashif

% Create a video object for the video
video = VideoReader(fileName);
frameCount = 0;

% Pre-allocate frames to make execution faster.
frames = cell(length(frameNumbers));

% Iterate through the frame numbers and store the specified video frames.
for i=1:length(frameNumbers)
    frameToFetch = frameNumbers(i);
    while frameToFetch > frameCount
        currentFrame = readFrame(video);
        frameCount = frameCount + 1;
    end
    frames{i}= currentFrame;
end
    
end