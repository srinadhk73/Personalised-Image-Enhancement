%%PLEASE RUN EACH SECTION INDIVIDUALLY

%% 
%Run this section to start the training. There are 20 training images and
%for each training image there are 9 differently enhanced images. Choose
%the one that you like the best for each training image. The "Next Image"
%and "Previous Image" buttons help you to navigate."Check selections"
%prints the images that are not yet selected by the user. After selecting
%preferences for each of the 20 training images, click on "Finish
%Training". Please wait for your selected to be highlighted before clicking
%"Next Image" or "Previous Image".
addpath(genpath('../EE368-Project'))
traininggui

%%
%This script enhances the test images based on your preferences. Run this 
%after training.
TestImageGenerate

%%
%This section opens up the testing GUI. You will be shown 30 pairs of 
%images. Choose the image that you prefer more than the other. There is
%also a "NO PREFERENCE" button if you don't prefer any of the images. There
%is nothing to indicate that you clicked "NO PREFERENCE", but be assured
%your response has been recorded. Once you get through all 30 images, the
%testing GUI will automatically close. If you find that you cannot proceed
%to a new image but the GUI has not exited, you may have missed a test
%image. If this occurs, close the GUI, start over, and be sure to make a
%selection on every page.
testguiTemplate

%%
%This will load the test results and print it out. For 10 test images, 
%the presonalized enhanced images were compared to the original image, 
%Google Photos-enhanced image and Photoshop-enhanced. The first column
%corresponds to the results vs. the original images. The second column
%corresponds to the resulte vs. the Google photos-enhanced images. The
%third column corresponds to the results vs. the Photoshop-enhanced images.
load testResults
results.other = 10-results.custom-results.noPref;
results