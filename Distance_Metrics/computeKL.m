function [ dKL ] = computeKL(p1, p2)
%COMPUTEKL Computes the KL divergence between two images

%need to add epsilon so not taking log(0)

p1 = p1(:) + eps;
p2 = p2(:) + eps;
dKL = sum((p1 - p2).*(log(p1) - log(p2)));

end

