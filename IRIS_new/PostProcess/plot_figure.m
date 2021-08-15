function y = plot_figure(xWidth,yWidth, time_shifted, data, clr, yLabelText, min_time, max_time, y_lim_min, y_lim_max)

    divider = 50;
    fontsize = 40;

    h = figure('units','normalized','outerposition',[0 0 xWidth yWidth]);
    %plot(time_shifted,data,'Linewidth', 3, 'Color', 'b','Marker','d');
    y = line_fewer_markers(time_shifted, data , length(data)/divider,'o-','Spacing', 'x',...
        'Linewidth', 3,'Color',clr, 'MarkerSize',10);
    set(gca, 'FontSize', fontsize, 'FontWeight', 'Bold');
    xlabel('Time (s)');
    ylabel(yLabelText);
    grid on;
    grid minor;
    xlim([min_time,max_time]);
    ylim([y_lim_min,y_lim_max]);
    box on;
%     print(strcat(base_dir,'Results/',out_file_name),'-depsc');
%     print(strcat(base_dir,'Results/',out_file_name),'-dpng');
%     savefig(h, strcat(base_dir,'Results/',out_file_name,'.fig'));

end