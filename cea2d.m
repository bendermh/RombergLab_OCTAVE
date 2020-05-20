% Script to plot Accelerometer Data
% from RombergLab for iOS APP - https://apps.apple.com/us/app/romberglab/id1440287860?l=en 
% Originally developed by Jorge Rey-Martinez 2018
% Authors: Ariadna Valldeperes, Xabier Altuna, Jorge Rey Martinez 
% (C)2020

function area = cea2d(x,y,P)

chisquare = chi2inv(P,2); %inverse of the chi-square cumulative distribution function with 2 degrees of freedom at P
x = x(isfinite(x));
y = y(isfinite(y));
[~,val] = eig(cov(x,y)); %calculation of eigenvalues

area = pi*chisquare*prod(sqrt(svd(val))); %area calculation

