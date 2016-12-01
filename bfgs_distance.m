%% Calculate the 3D distance matrix and parameter matrix
Dimages = zeros(500, 500, 25);
Dparameters = zeros(500, 500);

for i=1:500
    i
    I1 = imresize(im2double(imread(['Dataset/DatasetImages/'...
        num2str(i) '.jpg'])),[240, 320]);
    for j=i:500
        I2 = imresize(im2double(imread(['Dataset/DatasetImages/'...
            num2str(j) '.jpg'])),[240, 320]);
        Dimages(i,j,:) = real(compute_distance(I1, I2));
        autoparams1 = autopreprocess_params(I1);
        autoparams2 = autopreprocess_params(I2);
        Dparameters(i,j) = norm(autoparams1-autoparams2);
        Dimages(j,i,:) = Dimages(i,j,:);
        Dparameters(j,i) = Dparameters(i,j);
    end
end