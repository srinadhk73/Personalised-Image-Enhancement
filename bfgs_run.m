global Dimages
global Dparameters
global Dimages_n

load('imagepairs_distance.mat');
Dp = load('parameters_distances.mat');

Dparameters = Dp.Dparameters;
Dimages_n = normalize_distances(Dimages);

options = optimoptions(@fminunc,'Algorithm','quasi-newton','Display',...
    'iter','MaxFunctionEvaluations',1e5,'MaxIterations',...
    1e3,'OptimalityTolerance',1e-7);

alpha = fminunc(@bfgs_func,ones(25,1),options);

save('alphas.mat', 'alpha');
