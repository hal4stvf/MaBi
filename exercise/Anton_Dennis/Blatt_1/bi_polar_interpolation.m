function [ output_point ] = bi_polar_interpolation( p , Im_in )
%% Von diskret nach kontinuierlich mittels bi-polarer Interpolation
x = max([1,p(1)]);
y = max([1,p(2)]);
a = Im_in( floor(x) , ceil(y));
b = Im_in( ceil(x) , ceil(y));
c = Im_in( floor(x), floor(y));
d = Im_in( ceil(x), floor(y));

x = p(1);
y = p(2);
alpha = x - floor(x);
beta = ceil(y) - y;

output_point = (1-alpha)*(1-beta)*a + alpha*(1-beta)*b + (1-alpha)*beta * c + alpha * beta * d;
%Formel abgeschrieben




end

