% ID:1107023
% Program for question 8 to generate the graph

% function used in Q8
f = @(x) exp(-50 * ((x - 1).^(2)));
% Exact value of integral in Q8
exact = (erf(20 * sqrt(2)) * (sqrt(2 * pi))) /10;

% Starting epsilon
eps = 10^(-6);
% Generate vectors of length 10 of x and y to fill
x = rand(10,1);
y = rand(10,1);


% Split epsilon powers into equal segments from 10^-6 to 10^-12
% Use Adaptive Simpsons' formula with this error value and
% obtain the absolute value between the difference of this
% and the exact value, and store this as y
for i = 0:1:9
    pow = - (6 + ((2 * i) / 3));
    x(i + 1) = 10^pow;
    y(i + 1) = (abs(Sa(f,-3,5, x(i + 1)) - exact));
end

 
figure
% Plot expected error (y) against actual error (x)
% use log10 scale for both, gives easier to see graph
plot(log10(x),log10(y), 'r+')
hold on

%Plot y = x
h1 = plot(log10(x),log10(x)); 
legend(h1, 'f(x) = x');
title('Given error versus actual error of I using the Adaptive Simpsons method');
xlabel('log10 of given error');
ylabel('log10 of actual error');

