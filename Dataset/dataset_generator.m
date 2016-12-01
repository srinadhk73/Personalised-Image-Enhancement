%% Load all the URLs
fileID = fopen('imageLinks.txt');
URLs = textscan(fileID, '%s');
URLs = URLs{1};
fclose(fileID);

%% Initialize variables
data_ind = zeros(2500,1);
num_imgs = 1;
seen = [];
s = 0;

%% Create the dataset. All images are larger than 640x480
while num_imgs < 2501
    s = s+1;
    r_ind = randi([1 size(URLs, 1)],1);
    if sum(seen==r_ind)==0
        seen = [seen; r_ind];
        img = webread(URLs{r_ind});
        if size(img,1)>=480 && size(img,2)>=640
            data_ind(num_imgs) = r_ind;
            s
            num_imgs
            num_imgs = num_imgs+1;
        end
    end
end

%%
%  Save the dataset indices, text files with dataset links, all the images
%  in a folder, all the images in a mat file
save('allLinks', 'URLs');
save('dataset_indices', 'data_ind');

%%
fileID1 = fopen('datasetLinks.txt','w');
for i = 1:size(data_ind,1)
    i
    datasetLinks{i} = URLs{data_ind(i)};
    fprintf(fileID1,'%s', datasetLinks{i});
    %Too large too store. Slows down the program. In the end, we care about
    %the 25 images
    %    datasetImages{i} = webread(datasetLinks{i});
    image = webread(datasetLinks{i});
    imwrite(image, ['Dataset_Images_prev/' num2str(i) '.jpg']);
end
fclose(fileID1);
save('datasetLinks','datasetLinks');
% save('datasetImages', 'datasetImages');

%% Initialize variables
num_imgs = 1;
seen = [];
s = 0;

%% Create the dataset. All images are larger than 640x480
while num_imgs < 501
    s = s+1;
    r_ind = randi([1, 2500],1);
    if sum(seen==r_ind)==0
        seen = [seen; r_ind];
        img = imread(['Dataset_Images_prev/' num2str(r_ind) '.jpg']);
        if (size(img,3) == 3)
            imwrite(img, ['DatasetImages/' num2str(num_imgs) '.jpg']);
            num_imgs = num_imgs+1;
        end
    end
end

