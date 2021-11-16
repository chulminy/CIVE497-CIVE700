J = @(x) (x-2).*(x+2);
Jp =@(x) 2.*x;

nIter = 10;

xrange = -5:0.01:5;
y_org = J(xrange);

figure(1)

subplot(221);
plot(xrange, y_org, 'k', 'linewidth', 3); grid on;  hold on;

lr = 0.1;
x = zeros(nIter,1);
x(1) = -4;
for ii=1:nIter-1
    x(ii+1) = x(ii) - lr*Jp(x(ii));
end
y = J(x);
plot(x, y, 'or'); line(x,y,'linewidth', 2, 'color', 'r', 'LineStyle', '--');
xlabel('x'); ylabel('y'); hold off;


subplot(222);
plot(xrange, y_org, 'k', 'linewidth', 3); grid on;  hold on;

lr = 0.01;
x = zeros(nIter,1);
x(1) = -4;
for ii=1:nIter-1
    x(ii+1) = x(ii) - lr*Jp(x(ii));
end
y = J(x);
plot(x, y, 'or'); line(x,y,'linewidth', 2, 'color', 'r', 'LineStyle', '--');
xlabel('x'); ylabel('y'); hold off;

subplot(223);
plot(xrange, y_org, 'k', 'linewidth', 3); grid on;  hold on;

lr = 0.9;
x = zeros(nIter,1);
x(1) = -4;
for ii=1:nIter-1
    x(ii+1) = x(ii) - lr*Jp(x(ii));
end
y = J(x);
plot(x, y, 'or'); line(x,y,'linewidth', 2, 'color', 'r', 'LineStyle', '--');
xlabel('x'); ylabel('y'); hold off;

subplot(224);
xrange = -25:0.01:25;
y_org = J(xrange);
plot(xrange, y_org, 'k', 'linewidth', 3); grid on;  hold on;

lr = 1.1;
x = zeros(nIter,1);
x(1) = -4;
for ii=1:nIter-1
    x(ii+1) = x(ii) - lr*Jp(x(ii));
end
y = J(x);
plot(x, y, 'or'); line(x,y,'linewidth', 2, 'color', 'r', 'LineStyle', '--');
xlabel('x'); ylabel('y'); hold off;
