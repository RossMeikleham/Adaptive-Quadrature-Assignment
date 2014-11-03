f = @(x) sin(1 - (24 * erf((x - 1)/(0.2 * sqrt(2)))));

epsilon = 10^(-4);

x = 0:epsilon:2;
y = f(x);

x1= unique(Sa2(f,0,2,0.001));
num = numel(x1)
y1 = f(x1);

figure
plot(x,y)
hold on
plot(x1,y1, 'r+') %,'b',xmarkers,ymarkers,'b')


x2 = linspace(0, 2, num);
y2 = f(x2);

figure
plot(x,y)
hold on
plot(x2, y2, 'r+')

