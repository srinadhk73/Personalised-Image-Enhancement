%Was just testing the functions I made

x = [6 5];
z = [5 6];
y = [1 1;
     2 2];
 
%% computes L1, L2, and LInf norms 
 
difference = x - z;
L1normX = LPNorm(x,1)
L2NormX = LPNorm(x,2)
lInfNormX = LPNorm(x,'inf')
L1normY = LPNorm(y,1)
L2NormY = LPNorm(y,2)
lInfNormY = LPNorm(y,'inf')

L1normdiff = LPNorm(difference,1)
L2Normdiff = LPNorm(difference,2)
LInfNormdiff = LPNorm(difference,'inf')

%% computes the KL Divergence of two matrices
dKLx_z = computeKL(x, z)