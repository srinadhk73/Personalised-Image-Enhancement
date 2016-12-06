load('alphas.mat');
load('allpossible81.mat');
params81 = allpossible81;

params81(:,1) = 7.5*params81(:,1);
params81(:,2) = 7.5*params81(:,2);
params81(:,3) = 0.5+0.2*params81(:,3);
temp_p = params81(:,4);
temp_p2 = zeros(size(temp_p));
temp_p2(temp_p==0) = 1;
temp_p2(temp_p==1) = 1.5;
temp_p2(temp_p==-1) = 0.75;
params81(:,4) = temp_p2;
params_rem = [];
for t=1:9
    flag = 0;
    for u=1:9
        if (~flag && params81((t-1)*9+u+1,4)==1)
            params_rem = [params_rem;(t-1)*9+u+1];
            flag = 1;
        end
    end
end
params81(params_rem, :) = [];

for num_img=1:25
    num_img
    Inl = im2double(imread(['TrainingImages/' num2str(num_img) '.jpg']));
    I = Inl.^(2.2);
    I = autopreprocess(I);
    Iresizeparams = zeros(240, 320, 3, size(params81,1));
    for r=1:size(params81,1)
        Iresizeparams(:,:,:,r) = imresize(process_image(I, ...
            params81(r,:)), [240 320]);
    end
    
    Dimages = zeros(size(params81,1), size(params81,1), 25);
    for i=1:size(params81,1)
        if rem(i,10)==0
            i
        end
        I1 = Iresizeparams(:,:,:,i);
        for j=i:size(params81,1)
            I2 = Iresizeparams(:,:,:,j);
            Dimages(i,j,:) = real(compute_distance(I1, I2));
            Dimages(j,i,:) = Dimages(i,j,:);
        end
    end
    clear Iresizeparams
    Dimages_n = normalize_distances(Dimages);
    alphaDimages = bsxfun(@times,Dimages_n,...
        reshape(alpha,[1 1 length(alpha)]));
    alphaDimages = sum(alphaDimages, 3);
    
    K = exp(-alphaDimages./mean(alphaDimages(:)));
    
    top8 = sensorPlacementOpt(K, 8);
    
    top8params = params81(top8,:);
    for p=1:9
        if (p==1)
            training_images.images{p} = I;
            training_images.params{p} = params81(1,:);
        else
            training_images.images{p} = ...
                process_image(I, top8params(p-1,:));
            training_images.params{p} =  params81(top8(p-1),:);
        end
        training_images.images{p} = ...
            real(training_images.images{p}.^(1/2.2));
    end
    save(['Training_Sets_7_5/training_data_' num2str(num_img)], ...
        'training_images');
    clear training_images
end