function [resultingImage] = ProcessImages(imageFiles, actionOtherwiseRemove)
%PROCESSIMAGES Generates and returns the resulting image from the image
%files input.
%   It has 2 inputs:
%   1) imageFiles - a cell array for the filenames of the images;
%   2) actionOtherwiseRemove - a boolean, true makes an action shot
%   otherwise the action is removed.
%   It has 0 outputs.

%   Author: Osama Kashif

images = ReadImages(imageFiles);

if (actionOtherwiseRemove)
    resultingImage = ActionShot(images);
else
    resultingImage = RemoveAction(images);
end

end