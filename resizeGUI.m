function [ outStruct ] = resizeGUI(inStruct)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
desiredNumPixels = 640 * 480;
outStruct.params = inStruct.params;
for i = 1:9
    I = inStruct.images{i};
    totalPixels = size(I,1) * size(I,2);
    ratio = desiredNumPixels/totalPixels;
    outStruct.images{i} = imresize(I, sqrt(ratio));
end


end

