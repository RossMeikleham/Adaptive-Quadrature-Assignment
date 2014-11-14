f = @(x) sin(1 - (24 * erf((x - 1)/(0.2 * sqrt(2)))));

epsilon = 10^(-3);

x = 0:epsilon:2;
y = f(x);

x1= Sa2(f,0,2,epsilon);
num = numel(unique(x1))

figure
plot(x,y)
hold on
plot(x1,-1.1, 'r+') %,'b',xmarkers,ymarkers,'b')
axis([0,2,-1.2,1])

x2 = linspace(0, 2, (num - 1)/2);
y2 = f(x2);

figure
plot(x,y)
hold on
plot(x2, -1.1, 'r+')
axis([0,2,-1.2,1])
