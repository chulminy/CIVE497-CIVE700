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