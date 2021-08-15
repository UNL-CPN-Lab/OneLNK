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
samp_rate = 500e3;



PSD =  calculate_RSS(filename);
time_psd = ((0:length(PSD)-1)./(samp_rate)).*(N*R);
%plot_figure(xWidth,yWidth, time_psd, PSD, 'm', 'RSS (dBm)', 0, 5, -100, -40);

PL = 12 + 5.3 + 5.3 - PSD;

%plot_figure(xWidth,yWidth, time_psd, PL, 'r', 'Path Loss (dB)', 0, 5, 80, 120);


filename = '../header_post-fft_c.dat';



SNR =  calculate_SNR(filename);
SNR(1) = [];
%plot_figure(xWidth,yWidth, time_psd, SNR, 'b', 'SNR (dB)', 0, 5, 0, 20);


 PL_usrp = PL;
 RSS_usrp = PSD;
 SNR_usrp = SNR;
 t_usrp = time_psd;
 t_usrp = linspace(0,1218567168/(8*500e3),length(SNR_usrp));
 
 save USRP.mat SNR_usrp RSS_usrp PL_usrp t_usrp
