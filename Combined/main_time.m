clc;
clear all;
close all;

load mmWave.mat 
load IRIS.mat 
load USRP.mat
%load UG.mat




legend1 = 'mmWave (60GHz)';
legend2 = 'IRIS (568MHz)';
legend3 = 'USRP (5.8GHz)';
%legend4 = 'UG (433MHz)';


xWidth = 1;
yWidth = 1;


subidx = 0;
min_t = 0;
max_t = 60;
min_PL = 0;
max_PL= 10;
min_RSS = -80;
max_RSS= -40;
min_SNR = 0;
max_SNR= 30;
font_size =30;
lw = 3;

%d_ug = 2.19;
d_mm = 15.243047695260944607;
d_iris = 15.18503688767333948;
d_usrp = 15.046750761543173;

m = 1:1000:length(t_usrp);

cell31={{['-g']};{['-g']};{['-g']}};
figure('units','normalized','outerposition',[0 0 xWidth yWidth])
C = {cell31};
[h,labelfontsize] = subplotplus(C);

subidx = subidx + 1;
set(gcf,'CurrentAxes',h(subidx));
plot(t_mm,PL_mm./d_mm,'-o','Color','r','LineWidth',lw);
hold on
plot(t_iris,PL_iris./d_iris,':*','Color','b','LineWidth',lw);
plot(t_usrp(m),PL_usrp(m)./d_usrp,'--d','Color','g','LineWidth',lw);
%plot(t_ug,PL_ug./d_ug,'-s','Color','k');
set(gca, 'FontSize', font_size, 'FontWeight', 'Bold','YColor','k');
set(h(subidx),'XGrid','on','YGrid','on','Box','on','XMinorTick','off','YMinorTick','off','XMinorGrid','off','YMinorGrid','on','XTick',[0 50 100 150 200 250 300 350 400],'XTickLabel',[], 'YTick',[0 2 4 6 8 10],'YTickLabel',[0 2 4 6 8 10]);
%xlabel('Time (sec)', 'FontSize', font_size);
ylabel('PL (dB)/m', 'FontSize', font_size,'Color','k');
%legend(legend1, legend2, legend3, 'Location','Northeast' )
xlim([min_t max_t]);
ylim([min_PL max_PL]);
grid on
grid minor
box on

subidx = subidx + 1;
set(gcf,'CurrentAxes',h(subidx));
plot(t_mm,RSS_mm,'-o','Color','r','LineWidth',lw);
hold on
plot(t_iris,RSS_iris,':*','Color','b','LineWidth',lw);
plot(t_usrp(m),RSS_usrp(m),'--d','Color','g','LineWidth',lw);
%plot(t_ug,RSS_ug.*(-1),'-s','Color','k');
set(gca, 'FontSize', font_size, 'FontWeight', 'Bold','YColor','k');
set(h(subidx),'XGrid','on','YGrid','on','Box','on','XMinorTick','off','YMinorTick','off','XMinorGrid','off','YMinorGrid','on','XTick',[0 50 100 150 200 250 300 350 400],'XTickLabel',[],'YTick',[-80 -70 -60 -50 -40 ],'YTickLabel',[-80 -70 -60 -50 -40 ]);
%xlabel('Time (sec)', 'FontSize', font_size);
ylabel('RSS (dB)', 'FontSize', font_size,'Color','k');
legend(legend1, legend2, legend3, 'Location','Best' ,'FontSize',font_size -2)
xlim([min_t max_t]);
ylim([min_RSS max_RSS]);
grid on
grid minor
box on

subidx = subidx + 1;
set(gcf,'CurrentAxes',h(subidx));
plot(t_mm,SNR_mm,'-o','Color','r','LineWidth',lw);
hold on
plot(t_iris_snr,SNR_iris,':*','Color','b','LineWidth',lw);
plot(t_usrp(m),SNR_usrp(m),'--d','Color','g','LineWidth',lw);
%plot(t_ug,SNR_ug,'-s','Color','k');
set(gca, 'FontSize', font_size, 'FontWeight', 'Bold','YColor','k');
set(h(subidx),'XGrid','on','YGrid','on','Box','on','XMinorTick','off','YMinorTick','off','XMinorGrid','off','YMinorGrid','on','XTick',[0 10 20 30 40 50 60],'XTickLabel',[0 10 20 30 40 50 60]);
xlabel('Time (s)', 'FontSize', font_size);
ylabel('SNR (dB)', 'FontSize', font_size,'Color','k');
%legend(legend1, legend2, legend3, legend4, 'Location','Northeast' )
xlim([min_t max_t]);
ylim([min_SNR max_SNR]);
grid on
%grid minor
box on



h(1).Position(3)=0.92;
h(2).Position(3)=0.92;
h(3).Position(3)=0.92;
h(1).Position(2) = h(1).Position(2) + 0.07;
h(2).Position(2) = h(2).Position(2) + 0.07;
h(3).Position(2) = h(3).Position(2) + 0.07;

% mean(PL_mm./d_mm)
% mean(PL_iris./d_iris)
% mean(PL_usrp./d_usrp)
% mean(PL_ug./d_ug)

mean(RSS_mm)
mean(RSS_iris)
mean(RSS_usrp)
%mean(-1.*RSS_ug)

mean(SNR_mm)
mean(SNR_iris)
mean(SNR_usrp)
%mean(SNR_ug)

% print('Results/Combined_time','-depsc');
% print('Results/Combined_time','-dpng');
% savefig(strcat('Results/Combined_time','.fig'));

