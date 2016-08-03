%   The demo was written by Kun Zhan, Jicai Teng, Jinhui Shi
%   $Revision: 1.0.0.0 $  $Date: 2014/12/20 $ 10:30:18 $

%   Reference:
%   K. Zhan, J. Shi, J. Teng, Q. Li and M. Wang, 
%   "Feature-linking model for image enhancement," 
%   Neural Computation, vol. 28, no. 6, pp. 1072-1100, 2016.

close all;clc,clear
addpath(genpath(pwd));
K = 5;
Contrast = ones(K,1); Spatial_frequency = Contrast; Gradient = Contrast;
for k = 1 : K
    if k ==1
        I = imread('cameraman.tif');
    elseif k == 2
        I = imread('tire.tif');
    elseif k == 3
        I = imread('sunset.jpg');
    elseif k == 4
        I = imread('flower.png');
    else
        I = imread('Lunaria.png');
    end
    V = rgb2v(I);
    V_flm = FLM(V);
    [Contrast(k,1), Spatial_frequency(k,1), Gradient(k,1)] ...
        = QEvaluation(V_flm);
    figure,imshow([I v2rgb(I,V_flm)]);
end
display([Contrast Spatial_frequency Gradient])