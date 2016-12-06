load('correspondences.mat');
load('userParams.mat');
desiredNumPixels = 640*480;
for i=1:10
    i
    I = im2double(imread(['TestImages\' num2str(i) '.jpg']));
    I = I.^(2.2);
    I = autopreprocess(I);
    I = process_image(I, userParams(correspondences(i),:));
    I = real(I.^(1/2.2));
    totalPixels = size(I,1) * size(I,2);
    ratio = desiredNumPixels/totalPixels;
    I = imresize(I, sqrt(ratio));
    images{i} = I;
end
save('Final_Test_Images/custom_images', 'images'); 