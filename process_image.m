function [outputImage] = process_image(inputImage, params)
%PROCESS_IMAGE Contrast adjustment and color correction
outputImage = zeros(size(inputImage));

%contrast stretch
a = params(3);
lam = params(4);
maskLess = inputImage <= a;
outputImage(maskLess) = a - a*((1-inputImage(maskLess)./a).^lam);
outputImage(~maskLess)= a + (1-a)*(((inputImage(~maskLess)-a)./(1-a)).^lam);

%Temperature
outputImage(:,:,1) = outputImage(:,:,1) - params(1)/255.0;
outputImage(:,:,3) = outputImage(:,:,3) + params(1)/255.0;

%Tint
outputImage(:,:,2) = outputImage(:,:,2) + params(2)/255.0;


end

