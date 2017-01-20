%% Generating the co-embedding
% replace the main.m in the LEDF_release with this script to obtain the
% result

clear classes
close all
clc

rng(213);

% load the associate data file
load('Data/dot.mat');
R    = CalRelationXY(X,Y,'gaussian','mean');

opt  = {'optimisation', 'ga', 'obj_option', 'quant_knn', 'obj_para', {'knn', 5,5}};

para_range = {'eta1',[-1, 10],'eta2', [-1, 10],'alpha',[0, 3], 'beta',[0,3]};

I    = {'R', R, 'method', 'LEDeig','dim',2, 'model_optimisation', opt, 'parameter_range',para_range };

led    = LEDF(I);
led    = training(led);

save('dot_LEDF_results.mat');
figure;
Plotcluster(led.X',lx,led.Y',ly);