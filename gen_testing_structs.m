for i=1:10
    I = im2double(imread(['TestImages/' num2str(i) '.jpg']));
    desiredNumPixels = 640 * 480;
    totalPixels = size(I,1) * size(I,2);
    ratio = desiredNumPixels/totalPixels;
    Iresized = imresize(I, sqrt(ratio));
    images{i} = Iresized;
end
save('Final_Test_Images/original_images', 'images');
clear images

for i=1:10
    I = im2double(imread(['TestImagesGoogle/' num2str(i) '.jpg']));
    desiredNumPixels = 640 * 480;
    totalPixels = size(I,1) * size(I,2);
    ratio = desiredNumPixels/totalPixels;
    Iresized = imresize(I, sqrt(ratio));
    images{i} = Iresized;
end
save('Final_Test_Images/google_images', 'images');
clear images

for i=1:10
    I = im2double(imread(['TestImagesPhotoshop/' num2str(i) '.jpg']));
    desiredNumPixels = 640 * 480;
    totalPixels = size(I,1) * size(I,2);
    ratio = desiredNumPixels/totalPixels;
    Iresized = imresize(I, sqrt(ratio));
    images{i} = Iresized;
end
save('Final_Test_Images/photoshop_images', 'images');
clear images
