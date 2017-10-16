clc;
clear all;
close all;


tmp_samples = gamrnd(0.5, 2, [1 1000]);
samples = normrnd(0, sqrt(1./tmp_samples));

hist(samples, 100)