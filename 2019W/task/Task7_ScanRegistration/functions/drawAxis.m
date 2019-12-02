function drawAxis(T, L)
    xStart = T*[0,0,0,1]';
    xEnd = T*[L,0,0,1]';
    yStart = T*[0,0,0,1]';
    yEnd = T*[0,L,0,1]';
    zStart = T*[0,0,0,1]';
    zEnd = T*[0,0,L,1]';
    
    hold on
    plot3([xStart(1,1)  xEnd(1,1)], [xStart(2,1)  xEnd(2,1)], [xStart(3,1)  xEnd(3,1)], 'color', 'r') % plot x axis
    plot3([yStart(1,1)  yEnd(1,1)], [yStart(2,1)  yEnd(2,1)], [yStart(3,1)  yEnd(3,1)], 'color', 'g') % plot y axis
    plot3([zStart(1,1)  zEnd(1,1)], [zStart(2,1)  zEnd(2,1)], [zStart(3,1)  zEnd(3,1)], 'color', 'b') % plot z axis
    xlabel('x')
    ylabel('y')
    zlabel('z')
    grid on
    axis equal
end