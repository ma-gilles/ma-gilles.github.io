clear all; close all; clc; format shorte; rng(123);


% Parameters
n = 500;
m = 10000;

[U,S,V] = svd(randn(n,n));
S = diag(1/2+rand(1,n)/2);
A = U*S*U';
A = 1/2*(A+A');
b = 1 + rand(n,1);
save('precept11.mat','A','b');
h = 1/m;

y = zeros(n,1);
y = b;
x = 0;
for j=1:m
    x = x + h;
    y = y + h*(-y+sin(x)/2*A*y);
end
y1 = y;

y = b;
x = 0;
for j=1:2*m
    x = x + h/2;
    y = y + h/2*(-y+sin(x)/2*A*y);
end
y2 = y;


err = norm(y1-y2)/norm(y2)

clear all; close all; clc; format shorte; rng(123);

for y0 = linspace(-1,1,100);

% Parameters
n = 100;
a = 0;
b = .1;
h = (b-a)/n;
f = @(x,y)  100*(sin(x)-y);


y = zeros(n+1,1);
y(1) = y0;
x(1) = 0;
%for j = 1:n
%   x(j+1) = j*h;
%   y(j+1) = y(j) + h*f(x(j),y(j));
%end

for j = 1:n
   x(j+1) = j*h;
   g = @(a) a - y(j) - h*f(x(j),a);
   y(j+1) = fzero(g,y(j));
end

plot(x,y); hold all;


end

