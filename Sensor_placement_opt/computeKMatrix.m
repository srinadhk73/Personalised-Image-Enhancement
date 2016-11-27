function K = computeKMatrix(alpha, dataset)
%This function computes the K matrix given an input of alpha, which are the
%weights of the distance metrix, and the dataset of images. The dataset is
%a structure of 5000 images

D = zeros(size(dataset,1));

for i = 1:size(dataset,1)
    for j = i:size(dataset,1)
        I1 = dataset{i};
        I2 = dataset{j};
        D(i,j) = sum(alpha.*compute_distance(I1, I2));
        D(j,i) = D(i,j);
    end
end

K = exp(-D./mean(D(:)));

end

