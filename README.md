# EE368-Project

## First Push -- Created the distance metrics functions

Look in Distance_Metrics for all these files

Test_images folder:
Some images I downloaded to test all the functions.

DistanceMetricTest.m:
Sample pipeline for extracting various distance metrics.
We can add more things to this pipline if we want.

This file computes The L1, L2, LInf, and KL divergence between two
images, the L1, L2, LInf, and KL divergence of the histograms of each of the R G B color
channels, the L1, L2, LInf, and KL divergence between two grayscale
images, the L1, L2, LInf, and KL divergence between the grayscale
histograms of each image, and the entropy of the difference image.

computeKL.m:
Computes the KL divergence between two matrices.

LPNorm.m:
Computes the LPNorm between two matrices.

normTest.m:
Just a script to test the distance metrics.
