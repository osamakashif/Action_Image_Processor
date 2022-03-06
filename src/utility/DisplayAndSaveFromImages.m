function DisplayAndSaveFromImages(imageFiles, actionOtherwiseRemove)
%DISPLAYANDSAVEFROMIMAGES Gets the resulting image and then displays and
%saves it.
%   It has 2 inputs:
%   1) imageFiles - a cell array for the filenames of the images;
%   2) actionOtherwiseRemove - a boolean, true makes an action shot
%   otherwise the action is removed.
%   It has 0 outputs.

%   Author: Osama Kashif

resultingImage = ProcessImages(imageFiles, actionOtherwiseRemove);

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