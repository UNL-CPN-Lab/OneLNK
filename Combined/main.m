clc;
clear all;
close all;

load mmWave.mat 
load IRIS.mat 
load USRP.mat
load UG.mat




legend1 = 'mmWave';
legend2 = 'IRIS';
legend3 = 'USRP';
legend4 = 'UG';
n = 1:100;
m = 1:10:100;

xWidth = 0.8;
yWidth = 1;
font_size = 40;

subidx = 0;
min_t = 0;
max_t = 5;
min_PL = 60;
max_PL= 140;
min_RSS = -120;
max_RSS= -40;
min_SNR = 0;
max_SNR= 45;
font_size = 30;

d_ug = 2.19;
d_mm = ;
d_iris = ;
d_usrp = ;


cell31={{['-g']};{['-g']};{['-g']}};
figure('units','normalized','outerposition',[0 0 xWidth yWidth])
C = {cell31};
[h,labelfontsize] = subplotplus(C);

subidx = subidx + 1;
set(gcf,'CurrentAxes',h(subidx));
plot(n,PL_mm(n),'-o','Color','r');
hold on
plot(n,PL_iris(n),'-*','Color','b');
plot(n,PL_usrp(n),'-d','Color','m');
plot(n,PL_ug(n),'-s','Color','k');
set(gca, 'FontSize', font_size, 'FontWeight', 'Bold','YColor','k');
set(h(subidx),'XGrid','on','YGrid','on','Box','on','XMinorTick','off','YMinorTick','off','XMinorGrid','off','YMinorGrid','on','XTick',[0 50 100 150 200 250 300 350 400],'XTickLabel',[]);
%xlabel('Time (sec)', 'FontSize', font_size);
ylabel('PL (dB)', 'FontSize', font_size,'Color','k');
%legend(legend1, legend2, legend3, 'Location','Northeast' )
%xlim([min_t max_t]);
ylim([min_PL max_PL]);
grid on
grid minor
box on

subidx = subidx + 1;
set(gcf,'CurrentAxes',h(subidx));
plot(n,RSS_mm(n),'-o','Color','r');
hold on
plot(n,RSS_iris(n),'-*','Color','b');
plot(n,RSS_usrp(n),'-d','Color','m');
plot(n,RSS_ug(n).*(-1),'-s','Color','k');
set(gca, 'FontSize', font_size, 'FontWeight', 'Bold','YColor','k');
set(h(subidx),'XGrid','on','YGrid','on','Box','on','XMinorTick','off','YMinorTick','off','XMinorGrid','off','YMinorGrid','on','XTick',[0 50 100 150 200 250 300 350 400],'XTickLabel',[],'YTick',[-100 -80 -60 ],'YTickLabel',[-100 -80 -60 ]);
%xlabel('Time (sec)', 'FontSize', font_size);
ylabel('RSS (dB)', 'FontSize', font_size,'Color','k');
legend(legend1, legend2, legend3, legend4, 'Location','Northeast' ,'FontSize',font_size -10)
%xlim([min_t max_t]);
ylim([min_RSS max_RSS]);
grid on
grid minor
box on

subidx = subidx + 1;
set(gcf,'CurrentAxes',h(subidx));
plot(n,SNR_mm(n),'-o','Color','r');
hold on
plot(n,SNR_iris(n),'-*','Color','b');
plot(n,SNR_usrp(n),'-d','Color','m');
plot(n,SNR_ug(n),'-s','Color','k');
set(gca, 'FontSize', font_size, 'FontWeight', 'Bold','YColor','k');
set(h(subidx),'XGrid','on','YGrid','on','Box','on','XMinorTick','off','YMinorTick','off','XMinorGrid','off','YMinorGrid','on','XTick',[10 20 30 40 50 60 70 80 90 100],'XTickLabel',[10 20 30 40 50 60 70 80 90 100]);
xlabel('Sample #', 'FontSize', font_size);
ylabel('SNR (dB)', 'FontSize', font_size,'Color','k');
%legend(legend1, legend2, legend3, legend4, 'Location','Northeast' )
%xlim([min_t max_t]);
ylim([min_SNR max_SNR]);
grid on
%grid minor
box on

h(1).Position(3)=0.88;
h(2).Position(3)=0.88;
h(3).Position(3)=0.88;
h(1).Position(2) = h(1).Position(2) + 0.07;
h(2).Position(2) = h(2).Position(2) + 0.07;
h(3).Position(2) = h(3).Position(2) + 0.07;

print('Results/Combined','-depsc');
print('Results/Combined','-dpng');
savefig(strcat('Results/Combined','.fig'));

