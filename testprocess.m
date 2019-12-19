I = im2double(imread('TrainingImages/12.jpg'));
imshow(I)
pause(3)
I = I.^(2.2);
I = autopreprocess(I);
Tempadj = 5;
Tintadj = 5;
load('allpossible9.mat');
params9 = allpossible9;
params9(:,1) = Tempadj*params9(:,1);
params9(:,2) = Tintadj*params9(:,2);
for i=1:9
    figure()
    out = process_image(I,params9(i,:));
    imshow(out.^(1/2.2))
    pause(2)
end


params92 = [zeros(9,1) zeros(9,1) allpossible9];
%%
inputImage = I;
as = [0.3, 0.5, 0.7];
lams = [0.75, 1, 2];
outputImage = zeros(size(I));
for i=1:3
    for j=1:3
        a= as(j);
        lam = lams(i);
        maskLess = inputImage <= a;
        outputImage(maskLess) = a - a*((1-inputImage(maskLess)./a).^lam);
        outputImage(~maskLess)= a + (1-a)*(((inputImage(~maskLess)-a)./(1-a)).^lam);
        figure()
        imshow(outputImage.^(1/2.2))
    end
end

%%
load('allpossible81.mat');
params81 = allpossible81;

params81(:,1) = 20*params81(:,1);
params81(:,2) = 20*params81(:,2);
params81(:,3) = 0.5+0.2*params81(:,3);
temp_p = params81(:,4);
temp_p2 = zeros(size(temp_p));
temp_p2(temp_p==0) = 1;
temp_p2(temp_p==1) = 1.5;
temp_p2(temp_p==-1) = 0.75;
params81(:,4) = temp_p2;
figure()
for i=1:81
    out = process_image(I, params81(i,:));
    imshow(out.^(1/2.2));
    title([num2str(params81(i,1)) ' ' num2str(params81(i,2)) ' ' num2str(params81(i,3)) ...
        ' ' num2str(params81(i,4))]);
    pause(0.1)
end
