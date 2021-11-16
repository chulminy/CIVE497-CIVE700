clear; close all; clc

rng(12);

% line equation: y = 0.5x - 0.5;
m = 0.5;
b = -0.5;

x_range = -8:0.5:8;

dataPt_x = 3;
dataPt_y = m*dataPt_x + b;

y_range = [-4 4];

h = figure(1);
set(h, 'Position', [100, 100, 400, 200]);

endPt_x = [min(x_range) max(x_range)];
endPt_y = m*endPt_x + b;
line(endPt_x, endPt_y,  'linewidth', 1.5, 'Color', 'k', 'lineStyle', '--');hold on;
text(endPt_x(2)-1, endPt_y(1)+1, sprintf('y = %sx + %s', num2str(m), num2str(b)),'horiz','right','vert','bottom','FontWeight','bold');
plot(dataPt_x(1), dataPt_y(1), 'ob', 'linewidth', 3);

axis equal; grid on; hold off
xlabel('\bf X-axis');xlim(endPt_x)
ylabel('\bf Y-axis');ylim(y_range)
set(gca,'xtick',endPt_x(1):1:endPt_x(2))
set(gca,'fontsize',10,'linewidth',2,'fontweight','bold')

theta_axis = -89:2:89;

h = figure(2);
set(h, 'Position', [100, 100, 1400, 600]);
axes_h1 = subplot(121);
axes_h2 = subplot(122);

hough_pt = [];
count = 1;
for ii=1:numel(theta_axis)
    
    cla(axes_h1);
    theta = theta_axis(ii);    
    if sign(theta_axis(ii))==-1
        slope = -1/tand(theta);
    else
        slope = -1/tand(theta);
    end
    y_inter = dataPt_y - slope*dataPt_x;
    
    endPt_x = [min(x_range) max(x_range)];
    endPt_y = slope*endPt_x + y_inter;
    line(axes_h1, endPt_x, endPt_y,  'linewidth', 1.5, 'Color', 'k', 'lineStyle', '--'); hold(axes_h1, 'on');
    line(axes_h1, endPt_x, [0 0],  'linewidth', 3, 'Color', 'k','HandleVisibility','off');
    line(axes_h1, [0 0], y_range,  'linewidth', 3, 'Color', 'k','HandleVisibility','off');
    plot(axes_h1, dataPt_x(1), dataPt_y(1), 'ob', 'linewidth', 3,'HandleVisibility','off');
    
    % cls_pt : (-ac/(a^2+b^2), -bc/(a^2 + b^2))
    % https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line
    a = slope;
    b = -1;
    c = y_inter;
    
    cls_pt = [-a*c/(a^2+b^2) -b*c/(a^2+b^2)];
    line(axes_h1, [0 cls_pt(1)], [0 cls_pt(2)], 'linewidth', 1.5, 'Color', 'm', 'lineStyle', '--');
        
    legend(axes_h1, {'Possible line','\rho'}, 'Location', 'SouthWest', 'fontSize', 12, 'fontWeight', 'bold');
    
    axis(axes_h1,'equal');
    grid(axes_h1, 'on'); hold(axes_h1, 'off');
    xlabel(axes_h1,'\bf X-axis');xlim(axes_h1, endPt_x)
    ylabel(axes_h1,'\bf Y-axis');ylim(axes_h1, y_range)
    set(axes_h1,'xtick',endPt_x(1):1:endPt_x(2))
    set(axes_h1,'fontsize',10,'linewidth',2,'fontweight','bold');

    
    rho = dataPt_x*cosd(theta)+dataPt_y*sind(theta);
    hough_pt(ii, :) = [theta, rho];
    plot(axes_h2, hough_pt(:,1), hough_pt(:,2), 'ob', 'linewidth', 3);hold(axes_h2, 'on');
    
    grid(axes_h2, 'on'); hold(axes_h2, 'off');
    set(axes_h2,'fontsize',10,'linewidth',2,'fontweight','bold')
    xlabel(axes_h2, '\bf \theta', 'fontSize', 15);xlim(axes_h2, [-90 90]);
    ylabel(axes_h2, '\bf \rho', 'fontSize', 15);ylim([-4 4]);
    pause(0.5);

    movie_frame(count) = getframe(h);
    count = count + 1;
end

v = VideoWriter('hough_transform','MPEG-4');
v.FrameRate = 1;
open(v);
writeVideo(v,movie_frame);
close(v);