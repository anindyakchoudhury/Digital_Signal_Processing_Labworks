function [y ny] = conv_m (x, nx, h, nh)

nymin = nx(1)+nh(1);
nymax = nx(end)+nh(end);
ny = nymin:nymax;
y = conv(x,h);
end
