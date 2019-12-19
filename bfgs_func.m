function [out] = bfgs_func(alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global Dimages_n
global Dparameters
alphaDimages = bsxfun(@times,Dimages_n,reshape(alpha,[1 1 length(alpha)]));
alphaDimages = sum(alphaDimages,3);
out = sumsqr(alphaDimages-Dparameters);
end

