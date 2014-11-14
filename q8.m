% Program for question 8 to generate the graph
% Once ran, need to edit Axes Properties and change
% Y-Axis to use a logarithmic scale

f = @(x) exp(-50 * ((x - 1).^(2)));
exact = (erf(20 * sqrt(2)) * (sqrt(2 * pi))) /10;

eps = 10^(-6);
x = rand(10,1);
y = rand(10,1);


% Split powers into equal segments from 10^-6 to 10^-7
for i = 0:1:9
    pow = - (6 + ((2 * i) / 3));
    x(i + 1) = 10^pow;
    y(i + 1) = (abs(Sa(f,-3,5, x(i + 1)) - exact));
end

%Draw
display(x)
display(y)
figure
plot(log10(x),log10(y), 'r+')
%ylim([10^(-12), 10^(-6)]);
hold on

%Plot y = x
h1 = plot(log10(x),log10(x)); 
legend(h1, 'f(x) = x');
title('Given error versus actual error of I using the Adaptive Simpsons method');
xlabel('log10 of given error');
ylabel('log10 of actual error');
%ylim([10^(-12), 10^(-6)]);
