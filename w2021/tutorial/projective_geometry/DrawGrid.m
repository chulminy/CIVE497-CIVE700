function DrawGrid(ax, pos, adj, col_dot, xylim)

adj = adj-triu(adj);

[I, J] = ind2sub(size(adj),find(adj(:)));

line(ax, [pos(I,1) pos(J,1)]',[pos(I,2) pos(J,2)]', 'Color', 'k', 'linewidth',  1.5); hold on;
for ii=1:size(pos,1)
    plot(pos(ii,1), pos(ii,2),'Marker', 'o',  ...
        'MarkerFaceColor', col_dot(ii,:), 'LineStyle', 'none', ...
        'MarkerEdgeColor', col_dot(ii,:), 'linewidth', 1.5); 
end; hold off; 

axis(ax,'equal'); grid on;
xlabel(ax, '\bf X-axis'); xlim(xylim(1,:));
ylabel(ax, '\bf y-axis'); ylim(xylim(2,:));
set(ax,'fontsize',10,'linewidth',2,'fontweight','bold');