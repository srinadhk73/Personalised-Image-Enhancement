load('alphas.mat')
Ds = zeros(10,20,25);
for i=1:10
    i
    IT = imresize(im2double(imread(['TestImages/'...
        num2str(i) '.jpg'])),[240, 320]);
    for j=1:20
        ITr = imresize(im2double(imread(['TrainingImages/'...
            num2str(j) '.jpg'])),[240, 320]);
        Ds(i,j,:) = real(compute_distance(IT, ITr));
    end
end
Ds = normalize_distances(Ds);
alphaDimages = bsxfun(@times,Ds,...
    reshape(alpha,[1 1 length(alpha)]));
alphaDimages = sum(alphaDimages, 3);
correspondences = zeros(10,1);
for m=1:10
    [~,correspondences(m)] = min(alphaDimages(m,:));
end
save('correspondences', 'correspondences'); 