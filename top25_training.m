clear all;
w = load('alphas.mat');
alpha = w.alpha;
D = load('imagepairs_dist_normalized.mat');
Dimages_n = D.Dimages_n;
alphaDimages = bsxfun(@times,Dimages_n,reshape(alpha,[1 1 length(alpha)]));
alphaDimages = sum(alphaDimages, 3);

K = exp(-alphaDimages./mean(alphaDimages(:)));

top25 = sensorPlacementOpt(K, 40);

final_top25 = [top25(3:4); top25(7:8); top25(10:12); top25(14);...
                top25(16:17); top25(21:23); top25(25:26); top25(28); 
             top25(30:33); top25(35); top25(37:40)];

for i=1:length(final_top25)
    I = imread(['DatasetImages/' num2str(final_top25(i)) '.jpg']);
    imwrite(I,['TrainingImages/' num2str(i) '.jpg']);
end