in = [0.05 0.1 1];
out = [0.01 0.99];

Wmh1 = [0.15 0.2 0.35];
Wmh2 = [0.25 0.4 0.4];

h1n = in*Wmh1';
h2n = in*Wmh2';

h1o = fun_logi(h1n);
h2o = fun_logi(h2n);

Wmo1 = [0.40 0.45 0.2];
Wmo2 = [0.45 0.55 0.3];

o1n = [h1n h2n 1]*Wmo1';
o2n = [h1n h2n 1]*Wmo2';

o1o = fun_logi(o1n);
o2o = fun_logi(o2n);

err = sqrt((out(1)-o1o)^2 + (out(2)-o2o)^2);

function fx = fun_logi(x)

fx = 1/(1+exp(-x));

end


