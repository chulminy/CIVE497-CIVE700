logi_fun = @(x) 1/(1+exp(-x));

input = [0.05 0.1]';
w = [0.15 0.2 0.25 0.3 0.4 0.45 0.5 0.55]';
b = [0.35 0.6]';
out = [0.01 0.99]';

h1_in = input' * w(1:2) + b(1);
h1_out = logi_fun(h1_in);

h2_in = input' * w(3:4) + b(1);
h2_out = logi_fun(h2_in);

o1_in = [h1_out h2_out] * w(5:6) + b(2);
o1_out = logi_fun(o1_in);

o2_in = [h1_out h2_out] * w(7:8) + b(2);
o2_out = logi_fun(o2_in);

tmp = (out-[o1_out;o2_out]);
Etotal = 1/2*tmp'*tmp