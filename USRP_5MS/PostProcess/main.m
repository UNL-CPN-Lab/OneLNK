clc;
clear all;
close all;

format long g;

xWidth = 0.8;
yWidth = 0.8;

filename = '../payload_post-fft_c.dat';
N = 64;
R = 45;
samp_rate = 5e6;



PSD =  calculate_RSS(filename);
[m, n] = max(PSD);
time_psd = ((0:length(PSD)-1)./(samp_rate)).*(N*R);
plot_figure(xWidth,yWidth, time_psd, PSD, 'm', 'RSS (dBm)', 0, 25, -80, -20);





    
