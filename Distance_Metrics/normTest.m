x = [3 4];
y = [1 1;
     2 2]; 
L1normX = LPNorm(x,1)
L2NormX = LPNorm(x,2)
lInfNormX = LPNorm(x,'inf')
L1normY = LPNorm(y,1)
L2NormY = LPNorm(y,2)
lInfNormY = LPNorm(y,'inf')