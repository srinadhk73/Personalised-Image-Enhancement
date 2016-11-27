fileID = fopen('imageLinks.txt');
URLs = textscan(fileID, '%s');
URLs = URLs{1};
fclose(fileID);

num_imgs = 1;
seen = [];
while num_imgs < 5001
    r_ind = randi([1 size(URLs, 1)],1);
    if ~isempty(seen==r_ind)
      img = webread(URLs{r_ind});
      seen = [seen; r_ind];
    end
end