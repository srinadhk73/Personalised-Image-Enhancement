function [ Dimages_n ] = normalize_distances( Dimages )
%NORMALIZE_DISTANCES Normalize the distances to get all values in a
%reasonable range
sizeX = 320; sizeY = 240; numPixels = sizeX*sizeY;
Dimages_n = zeros(size(Dimages));
%L1Im
i=1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels*3);
%L2Im
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./sqrt(numPixels*3);
%LInfIm
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i);
%KLIm
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels*3);
%entropy_diff
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i);
%L1Im_Gray
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%L2Im_Gray
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./sqrt(numPixels);
%LInfIm_Gray
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i);
%KLIm_Gray
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%L1_rH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(256*numPixels);
%L1_gH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(256*numPixels);
%L1_bH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(256*numPixels);
%L2_rH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./sqrt(256*numPixels);
%L2_gH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./sqrt(256*numPixels);
%%L2_bH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./sqrt(256*numPixels);
%LInf_rH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%LInf_gH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%LInf_bH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%KLrH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%KLgH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%KLbH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%L1_GrayH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(256*numPixels);
%L2_GrayH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./sqrt(256*numPixels);
%LInf_GrayH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
%KLGrayH
i=i+1;
Dimages_n(:,:,i) = Dimages(:,:,i)./(numPixels);
end

