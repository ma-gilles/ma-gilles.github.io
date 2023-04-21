f = @(x) exp(-4*x.^2) + exp(-4*(abs(x)-pi).^2);
m = 200;
err = zeros(m,1);
for j = 1:m
n = 2*j;
h = 2*pi/n;
x = -pi:h:pi-h;
v = h*sum(f(x));
err(j) = abs(v - sqrt(pi));
end
ms = 2*(1:m);
plot(log10(ms),log10(err)); hold all;
for j = 2:2:8
ref = log10(ms.^-j) - log10(2^-j)+log10(err(1));
plot(log10(ms),ref)
end
