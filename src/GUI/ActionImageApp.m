function ActionImageApp
%ACTIONIMAGEAPP GUI for creating action shot/removed action images.
%   The app uses utility functions made to process the images/video. It
%   manages the input at the UI level, then the utility functions process
%   the input and output the result.

%   Author: Osama Kashif

% Create figure window
fig = uifigure;
fig.Name = "Action Image App";

% Manage app layout
gl = uigridlayout(fig,[12 2]);
gl.RowHeight = {'fit'};
gl.ColumnWidth = {'fit'};

% Create UI components
titleLabel = uilabel(gl, 'Text', "Action Image App");
titleLabel.HorizontalAlignment = 'center';
titleLabel.FontSize = 28;
vidLabel = uilabel(gl, 'Text', "Video");
vidLabel.HorizontalAlignment = 'center';
vidLabel.FontSize = 20;
inputVidFileBtn = uibutton(gl);
inputVidFileLabel = uilabel(gl);
firstFramesLabel = uilabel(gl);
firstFramesField = uieditfield(gl);
stepSizeLabel = uilabel(gl);
stepSizeField = uieditfield(gl);
numberOfFramesLabel = uilabel(gl);
numberOfFramesField = uieditfield(gl);
imgsLabel = uilabel(gl, 'Text', "Images");
imgsLabel.HorizontalAlignment = 'center';
imgsLabel.FontSize = 20;
inputImgsFileBtn = uibutton(gl);
inputImgsFileLabel = uilabel(gl);
processingLabel = uilabel(gl, 'Text', "Create Action Shot/Remove Action");
processingLabel.HorizontalAlignment = 'center';
processingLabel.FontSize = 20;
imgsOrVidLabel = uilabel(gl);
imgsOrVidDropdown = uidropdown(gl);
actionShotBtn = uibutton(gl);
rmvActionBtn = uibutton(gl);

% Lay out UI components
titleLabel.Layout.Row = 1;
titleLabel.Layout.Column = [1 2];
vidLabel.Layout.Row = 2;
vidLabel.Layout.Column = [1 2];
inputVidFileBtn.Layout.Row = 3;
inputVidFileBtn.Layout.Column = 1;
inputVidFileLabel.Layout.Row = 3;
inputVidFileLabel.Layout.Column = 2;
firstFramesLabel.Layout.Row = 4;
firstFramesLabel.Layout.Column = 1;
firstFramesField.Layout.Row = 4;
firstFramesField.Layout.Column = 2;
stepSizeLabel.Layout.Row = 5;
stepSizeLabel.Layout.Column = 1;
stepSizeField.Layout.Row = 5;
stepSizeField.Layout.Column = 2;
numberOfFramesLabel.Layout.Row = 6;
numberOfFramesLabel.Layout.Column = 1;
numberOfFramesField.Layout.Row = 6;
numberOfFramesField.Layout.Column = 2;
imgsLabel.Layout.Row = 7;
imgsLabel.Layout.Column = [1 2];
inputImgsFileBtn.Layout.Row = 8;
inputImgsFileBtn.Layout.Column = 1;
inputImgsFileLabel.Layout.Row = 8;
inputImgsFileLabel.Layout.Column = 2;
processingLabel.Layout.Row = 9;
processingLabel.Layout.Column = [1 2];
imgsOrVidLabel.Layout.Row = 10;
imgsOrVidLabel.Layout.Column = 1;
imgsOrVidDropdown.Layout.Row = 10;
imgsOrVidDropdown.Layout.Column = 2;
actionShotBtn.Layout.Row = 11;
actionShotBtn.Layout.Column = [1 2];
rmvActionBtn.Layout.Row = 12;
rmvActionBtn.Layout.Column = [1 2];

% Configure UI component appearance
inputVidFileBtn.Text = "Select Video";
inputVidFileLabel.Text = "";
firstFramesLabel.Text = "Starting frame of video:";
stepSizeLabel.Text = "Step size between frames:";
numberOfFramesLabel.Text = "Number of frames:";
inputImgsFileBtn.Text = "Select Images";
inputImgsFileLabel.Text = "";
imgsOrVidLabel.Text = "Process images or video?";
imgsOrVidDropdown.Items = ["Images", "Video"];
imgsOrVidDropdown.Value = "Images";
setImgOrVidOption("Images");
actionShotBtn.Text = "Create Action Shot";
rmvActionBtn.Text = "Remove Action";

% Assign callback functions
inputVidFileBtn.ButtonPushedFcn = {@selectVideo, inputVidFileLabel, fig};
inputImgsFileBtn.ButtonPushedFcn = {@selectImages, inputImgsFileLabel, fig};
imgsOrVidDropdown.ValueChangedFcn = {@updateImgOrVidOption};
firstFramesField.ValueChangedFcn = {@updateFirstFrame};
stepSizeField.ValueChangedFcn = {@updateStepSize};
numberOfFramesField.ValueChangedFcn = {@updateNumberOfFrames};
actionShotBtn.ButtonPushedFcn = {@createActionShotImage, fig};
rmvActionBtn.ButtonPushedFcn = {@createRemovedActionImage, fig};

% Get functions from utility folder.
% If condition to remove warnings in compiled version.
if isfolder('../utility/')
    addpath('../utility/');
end

end

% Program app behavior

function selectVideo(~, ~, fileLabel, app)
app.Visible = 0;
% Have user browse for a video file.
[baseFileName, folder] = uigetfile( ...
    {'*.mp4;*.mov;*.wmv;*.avi;*.mkv',...
    'Video Files (*.mp4,*.mov,*.wmv,*.avi,*.mkv)'},...
    'Select a video');
if baseFileName == 0
    % User clicked the Cancel button.
    return;
end
fullFileName = fullfile(folder, baseFileName);
fileLabel.Text = fullFileName;
setVidDir(fullFileName);
app.Visible = 1;
end

function selectImages(~, ~, fileLabel, app)
app.Visible = 0;
% Have user browse for image files.
[baseFileName, folder] = uigetfile( ...
    {'*.jpg;*.jpeg;*.png;*.gif;*.tiff;*.bmp',...
    'Image Files (*.jpg,*.jpeg,*.png,*.gif,*.tiff,*.bmp)'},...
    'Select image(s) to process', 'MultiSelect', 'on');
if not(iscell(baseFileName))
    if baseFileName == 0
        % User clicked the Cancel button.
        return;
    end
end
fullFileName = fullfile(folder, baseFileName);
fileLabel.Text = fullFileName;
setImgDir(fullFileName);
app.Visible = 1;
end


function updateImgOrVidOption(~, event)
setImgOrVidOption(event.Value);
end

function createActionShotImage(~,~, app)
app.Visible = 0;
switch getImgOrVidOption()
    case "Images"
        DisplayAndSaveFromImages(getImgDir(), 1);
    case "Video"
        DisplayAndSaveFromVideo(getVidDir(), getFirstFrame(), getStepSize(), getNumberOfFrames(), 1);
end
app.Visible = 1;
end

function createRemovedActionImage(~,~, app)
app.Visible = 0;
switch getImgOrVidOption()
    case "Images"
        DisplayAndSaveFromImages(getImgDir(), 0);
    case "Video"
        DisplayAndSaveFromVideo(getVidDir(), getFirstFrame(), getStepSize(), getNumberOfFrames(), 0);
end
app.Visible = 1;
end

function updateFirstFrame(~, event)
firstFrame = event.Value;
setFirstFrame(firstFrame);
end

function updateStepSize(~, event)
stepSize = event.Value;
setStepSize(stepSize);
end

function updateNumberOfFrames(~, event)
numberOfFrames = event.Value;
setNumberOfFrames(numberOfFrames);
end

% Global getters and setters for referencing by functions to work with GUI

function [vidDir] = getVidDir()
global vidDir;
end

function setVidDir(directory)
global vidDir;
vidDir = directory;
end

function [imgDir] = getImgDir()
global imgDir;
end

function setImgDir(directory)
global imgDir;
if ~iscell(directory)
    directory = {directory};
end
imgDir = directory;
end

function [imgOrVidOption] = getImgOrVidOption()
global imgOrVidOption;
end

function setImgOrVidOption(option)
global imgOrVidOption;
imgOrVidOption = option;
end

function [firstFrame] = getFirstFrame()
global firstFrame;
end

function setFirstFrame(firstFrameNum)
global firstFrame;
firstFrame = str2double(firstFrameNum);
end

function [stepSize] = getStepSize()
global stepSize;
end

function setStepSize(stepSizeNum)
global stepSize;
stepSize = str2double(stepSizeNum);
end

function [numberOfFrames] = getNumberOfFrames()
global numberOfFrames;
end

function setNumberOfFrames(frameNumbers)
global numberOfFrames;
numberOfFrames = str2double(frameNumbers);
end