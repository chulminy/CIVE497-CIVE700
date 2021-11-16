% Computation of the Cross-Corretation between Two Matrices
clear; close all; clc;

F = [0 0 0 1 0 0 0;0 1 1 1 0 0 0;0 1 1 1 0 1 1;0 1 1 1 1 0 0;0 0 0 0 1 0 0;0 1 0 0 0 0 0;0 0 0 0 1 1 1];
H = ones(3,3);

figure(1); 
subplot(121); PlotMat(F, gca, 'integer');title('F', 'FontSize', 15)
subplot(122); PlotMat(H, gca, 'integer');title('H', 'FontSize', 15)

[cF,rF] = size(F);
[cH,rH] = size(H);

xpt = ((rH-1)/2):((rF-rH+1));
ypt = ((cH-1)/2):((cF-cH+1));
G = zeros(numel(ypt), numel(xpt));

fig2 = figure(2);
set(fig2,'Position', [100 100 1000 400]);
axes_h1 = subplot(131); 
axes_h2 = subplot(132); PlotMat(H, axes_h2, 'integer');
title(axes_h2, 'H', 'FontSize', 15);
axes_h3 = subplot(133); 

count = 1;
for ii=1:numel(ypt)
    for jj=1:numel(xpt)
        PlotMat(F, axes_h1, 'integer');
        title(axes_h1, 'F', 'FontSize', 15);
        pos = [xpt(jj)-(rH-1)/2, ypt(ii)-(cH-1)/2, rH, cH];
        rectangle(axes_h1,'position',pos, 'EdgeColor','red', 'lineWidth', 3)
        
        F_yrange = (pos(2)+1) : (pos(2)+cH);
        F_xrange = (pos(1)+1) : (pos(1)+rH);

        G(ii,jj)= sum(F(F_yrange, F_xrange) .* H, 'all');
        
        PlotMat(G, axes_h3, 'integer');
        title(axes_h3, 'G', 'FontSize', 15);
        pos = [jj-1,ii-1, 1, 1];
        rectangle(axes_h3,'position',pos, 'EdgeColor','red', 'lineWidth', 3)
%         pause(3);
        movie_frame(count) = getframe(fig2);
        count = count + 1;
    end
end

v = VideoWriter('cross_correlation','MPEG-4');
v.FrameRate = 1;
open(v);
writeVideo(v,movie_frame);
close(v);

% Define an inline function to evaluate and print out true or false
logicStr = {'False', 'True'};
PrtEqual = @(M1Str, M1, M2Str, M2) fprintf('%s and %s are equal: %s. \n', M1Str, M2Str, logicStr{isequal(M1, M2)+1});

G_new = xcorr2(F, H);
G_new = G_new(cH:(end-cH+1),rH:(end-rH+1));
PrtEqual('G',G,'G_new',G_new);

function PlotMat(matrix, axes_handle ,numType)

ax = axes_handle;
[c,r] = size(matrix); % it should be 2D. 
imagesc(ax, matrix);            % Create a colored plot of the matrix values
colormap(ax, white); 

hold on;
% horizontal line
for ii=0:c
   line(ax, [0 r], [ii,ii], 'color', 'k',  'linewidth', 1.5);  
end

% vertical line
for ii=0:r
   line(ax, [ii ii], [0,c], 'color', 'k', 'linewidth', 1.5);  
end

if strcmp(numType, 'integer')
    textStrings = num2str(matrix(:), '%d');       % Create strings from the matrix values
    textStrings = strtrim(cellstr(textStrings));  % Remove any space padding
else
    textStrings = num2str(matrix(:), '%3.2f');       % Create strings from the matrix values
    textStrings = strtrim(cellstr(textStrings));  % Remove any space padding
end

[x, y] = meshgrid(1:c, 1:r);  
text(ax, x(:)-0.5, y(:)-0.5, textStrings(:), ...  % Plot the strings
                'HorizontalAlignment', 'center', ...
                'FontSize', 10, ...
                'FontWeight', 'bold');
axis(ax,'equal'); hold off;
xlim(ax,[0 r]);
ylim(ax,[0 c]);
set(ax, 'XTick', 1:r, 'YTick', 1:c, ...
    'XTickLabel',[], 'YTickLabel', [])
end
