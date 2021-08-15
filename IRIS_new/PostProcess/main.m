clc;
clear all;
close all;

format long g;

xWidth = 0.8;
yWidth = 0.8;

%filename = '../output_c.dat';
filename = '../payload_post-fft_c.dat';
N = 64;
R = 12;
samp_rate = 2e6;
filesize = 2166068944;
n = (filesize/8)/samp_rate;


PSD =  calculate_RSS(filename);
%time_psd = ((0:length(PSD)-1)./(samp_rate)).*(N*R);
time_psd = linspace(0,n,length(PSD));
%plot_figure(xWidth,yWidth, time_psd, PSD, 'm', 'RSS (dBm)', 0, 5, -100, -40);

PL = 12 + 5.3 + 5.3 - PSD;

%plot_figure(xWidth,yWidth, time_psd, PL, 'r', 'Path Loss (dB)', 0, 5, 70, 120);


filename = '../header_post-fft_c.dat';



SNR =  calculate_SNR(filename);
%SNR(1) = [];
%plot_figure(xWidth,yWidth, time_psd, SNR, 'b', 'SNR (dB)', 0, 5, 0, 20);

 PL_iris = PL;
 RSS_iris = PSD;
 SNR_iris = SNR;
 t_iris = time_psd;
 t_iris_snr = linspace(0,n,length(SNR));
 
 save IRIS.mat SNR_iris RSS_iris PL_iris t_iris t_iris_snr
