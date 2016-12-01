% This file implements the auto pre-processing step
% The image is first automatically white balanced using the gray world
% assumption on the 5% of the brightest pixel on each color channel. Then,
% the contrast of the image is automatically stretched using 0.4% as the
% lower limit and 99% as the higher limit
function autoparams = autopreprocess_params(in_img)
[out_img, Kvals] = autowhitebal_params(in_img);
con_lims = autocontrastadj_params(out_img);
autoparams = [Kvals; con_lims];
end

% This function implements auto white balance
function [out_img, Kvals] = autowhitebal_params(in_img)
out_img = zeros(size(in_img));
Kvals = zeros(3,1);
for i = 1:3
    temp = in_img(:,:,i);
    sort_temp = sort(temp(:),'descend');
    sort_temp = sort_temp(1:ceil(0.05*size(sort_temp,1)));
    Kvals(i) = mean(sort_temp);
end
out_img(:,:,1) = (Kvals(2)/Kvals(1)).*in_img(:,:,1);
out_img(:,:,2) = in_img(:,:,2);
out_img(:,:,3) = (Kvals(2)/Kvals(3)).*in_img(:,:,3);
end

% This function implements auto contrast stretch
function con_lims = autocontrastadj_params(in_img)
con_lims = stretchlim(rgb2gray(in_img),[0.004 0.99]);
end