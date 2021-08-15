clc;
clear all;
close all;

format long g;

xWidth = 0.8;
yWidth = 0.8;


filename = '../header_post-fft_c.dat';
N = 64;
R = 45;
samp_rate = 500e3;



SNR =  calculate_SNR(filename);
[m, n] = max(SNR);
time_psd = ((0:length(SNR)-1)./(samp_rate)).*(N*3);
plot_figure(xWidth,yWidth, time_psd, SNR, 'm', 'SNR (dB)', 0, 5, 0, 20);





    
