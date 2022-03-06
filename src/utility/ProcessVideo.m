function [resultingImage] = ProcessVideo(videoFileName, beginningFrame, frameStep, numberOfFrames, actionOtherwiseRemove)
%PROCESSVIDEO Generates and returns the resulting image from the video.
%   It has 5 inputs:
%   1) videoFileName - a character array for the filename of the video;
%   2) beginningFrame - a number for the starting video frame;
%   3) frameStep - a number for the step size;
%   4) numberOfFrames - a number for the number of frames;
%   5) actionOtherwiseRemove - a boolean, true makes an action shot
%   otherwise the action is removed.
%   It has 0 outputs.

%   Author: Osama Kashif
frameList = GenerateFrameList(beginningFrame, frameStep, numberOfFrames);
images = ReadFrames(videoFileName, frameList);
if (actionOtherwiseRemove)
    resultingImage = ActionShot(images);
else
    resultingImage = RemoveAction(images);
end
end