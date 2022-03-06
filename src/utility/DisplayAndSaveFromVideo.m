function DisplayAndSaveFromVideo(videoFileName, beginningFrame, frameStep, numberOfFrames, actionOtherwiseRemove)
%DISPLAYANDSAVEFROMVIDEO Gets the resulting image and then displays and
%saves it.
%   It has 5 inputs:
%   1) videoFileName - a character array for the filename of the video;
%   2) beginningFrame - a number for the starting video frame;
%   3) frameStep - a number for the step size;
%   4) numberOfFrames - a number for the number of frames;
%   5) actionOtherwiseRemove - a boolean, true makes an action shot
%   otherwise the action is removed.
%   It has 0 outputs.

%   Author: Osama Kashif

resultingImage = ProcessVideo(videoFileName, beginningFrame, frameStep, numberOfFrames, actionOtherwiseRemove);
figure
image(resultingImage);
if (actionOtherwiseRemove)
    title('Action shot');
    imwrite(resultingImage,'actionShot.png');
else
    title('Image with object removed');
    imwrite(resultingImage,'actionRemoved.png');
end
end