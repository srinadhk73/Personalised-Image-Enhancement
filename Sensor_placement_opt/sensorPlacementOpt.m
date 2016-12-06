function [ opt_ind ] = sensorPlacementOpt(K, num_img)
%SENSORPLACEMENTOPT This function finds the top num_img images in the
%dataset which maximally represents the dataset. It basically implements
%the sensor placement optimization algorithm
opt_ind = zeros(num_img, 1);
SU = zeros(size(K,1),1);
for n = 1:num_img
    n
    maxf = -realmax;
    for i = 1:size(K,1)
        if (SU(i)==0)
            ind_i = zeros(size(K,1),1); ind_i(i) = 1;
            ksi = K(logical(SU), logical(ind_i));
            kui = K(~(logical(SU) | logical(ind_i)), logical(ind_i));
            Kss = K(logical(SU), logical(SU));
            Kuu = K(~(logical(SU) | logical(ind_i)), ...
                ~(logical(SU) | logical(ind_i)));
            if ~isempty(ksi)
                f = (1-ksi'/Kss*ksi)/(1-kui'/Kuu*kui);
            else
                f = 1/(1-kui'/Kuu*kui);
            end
            if f > maxf
                maxf = f;
                maxi = i;
            end
        end
    end
    SU(maxi) = 1;
    opt_ind(n) = maxi;
end
end

