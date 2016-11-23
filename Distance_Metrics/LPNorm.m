function norm = LPNorm(I1, p)
%LPNORM Finds the L P norm of a matrix


I1_vec = I1(:);
if strcmp('inf', p)
    norm = max(I1_vec);
else
    norm = (sum(abs(I1_vec).^p)).^(1/p);
end

end

