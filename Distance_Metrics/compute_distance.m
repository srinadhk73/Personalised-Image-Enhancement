function distance_vector = compute_distance(I1, I2)
% This file computes The L1, L2, LInf, and KL divergence between two
% images, the L1, L2, LInf, and KL divergence of each of the R G B color
% channels, the L1, L2, LInf, and KL divergence between two grayscale
% images, the L1, L2, LInf, and KL divergence between the grayscale
% histograms of each image, and the entropy of the difference image.

%Resize the images so that they are the same size. Make the small image the
%same size as the bigger image. Assuming an RGB is input.
%if length(I1(:)) > length(I2(:))
 %   [numRows, numCols, ~] = size(I1);
  %  I2 = imresize(I2, [numRows, numCols]);
%else
 %   [numRows, numCols, ~] = size(I2);
  %  I1 = imresize(I1, [numRows, numCols]);
%end

%% Color Image Distance Metric

%Convert to doubles
I1D = im2double(I1);
I2D = im2double(I2);

%compute difference image
diff = I1D - I2D;

%compute L1 distance between images
L1Im = LPNorm(diff, 1);

%compute L2 distance between images
L2Im = LPNorm(diff, 2);

%compute LInf distance between images
LInfIm = LPNorm(diff, 'inf');

%compute KL Divergence  between images
KLIm = computeKL(I1D, I2D);
%% Calculate Entropy of RGB Difference Image

entropy_diff = entropy(diff);

%% Color Histogram Distance Metrics

%get different color channels for both images and compute histograms
I1_r = I1(:,:,1);
I1_g = I1(:,:,2);
I1_b = I1(:,:,3);
[counts1_r, centers] = imhist(I1_r);
[counts1_g, centers] = imhist(I1_g);
[counts1_b, centers] = imhist(I1_b);

I2_r = I2(:,:,1);
I2_g = I2(:,:,2);
I2_b = I2(:,:,3);
[counts2_r, centers] = imhist(I2_r);
[counts2_g, centers] = imhist(I2_g);
[counts2_b, centers] = imhist(I2_b);

% Get differences of histograms per channel
diff_r = counts1_r - counts2_r;
diff_g = counts1_g - counts2_g;
diff_b = counts1_b - counts2_b;

%compute L1 distance between histograms per channel
L1_rH = LPNorm(diff_r, 1);
L1_gH = LPNorm(diff_g, 1);
L1_bH = LPNorm(diff_b, 1);

%compute L2 distance between histograms per channel
L2_rH = LPNorm(diff_r, 2);
L2_gH = LPNorm(diff_g, 2);
L2_bH = LPNorm(diff_b, 2);

%compute LInf distance between histograms per channel
LInf_rH = LPNorm(diff_r, 'inf');
LInf_gH = LPNorm(diff_g, 'inf');
LInf_bH = LPNorm(diff_b, 'inf');

%compute KL Divergence  between histograms
KLrH = computeKL(counts1_r, counts2_r);
KLgH = computeKL(counts1_g, counts2_g);
KLbH = computeKL(counts1_b, counts2_b);

%% Grayscale Image Distance Metrics

%compute grayscale images
I1Gray = im2double(rgb2gray(I1));
I2Gray = im2double(rgb2gray(I2));

%compute difference image
diff = I1Gray - I2Gray;

%compute L1 distance between images
L1Im_Gray = LPNorm(diff, 1);

%compute L2 distance between images
L2Im_Gray = LPNorm(diff, 2);

%compute LInf distance between images
LInfIm_Gray = LPNorm(diff, 'inf');

%compute KL Divergence  between images
KLIm_Gray = computeKL(I1Gray, I2Gray);

%% Grayscale Histogram Distance Metrics

%get grayscale histograms

[counts1_Gray, centers] = imhist(I1Gray);
[counts2_Gray, centers] = imhist(I2Gray);


% Get differences of histograms
diff_Gray = counts1_Gray - counts2_Gray;


%compute L1 distance between histograms 
L1_GrayH = LPNorm(diff_Gray, 1);


%compute L2 distance between histograms 
L2_GrayH = LPNorm(diff_Gray, 2);


%compute LInf distance between histograms 
LInf_GrayH = LPNorm(diff_Gray, 'inf');


%compute KL Divergence  between histograms
KLGrayH = computeKL(counts1_Gray, counts2_Gray);

%% Put everything into a big vector

distVectorColorIms = [L1Im, L2Im, LInfIm, KLIm, entropy_diff];
distVectorGrayscaleIms = [L1Im_Gray, L2Im_Gray, LInfIm_Gray, KLIm_Gray];
distVectorColorHists = [L1_rH, L1_gH, L1_bH, L2_rH, L2_gH, L2_bH,...
                        LInf_rH, LInf_gH, LInf_bH, KLrH, KLgH, KLbH];
distVectorGrayscaleHists = [L1_GrayH, L2_GrayH, LInf_GrayH , KLGrayH];

distance_vector = [distVectorColorIms, distVectorGrayscaleIms...
              distVectorColorHists, distVectorGrayscaleHists];





end

