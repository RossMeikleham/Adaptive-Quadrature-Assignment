
f = @(x) exp(-50 * ((x - 1).^(2)));
exact = (erf(20 * sqrt(2)) * (sqrt(2 * pi))) /10;

eps = 10^(-6);
x = rand(10,1);
y = rand(10,1);

% Split powers into equal segments from 10^-6 to 10^-7
for i = 0:1:9
    pow = - (6 + ((2 * i) / 3));
    x(i + 1) = 10^pow;
    y(i + 1) = (abs(Sa(f,-3,5, 10^pow) - exact));
end


figure
plot(x,y)
%hold on
%plot(x1,y1, 'r+') %,'b',xmarkers,ymarkers,'b')
