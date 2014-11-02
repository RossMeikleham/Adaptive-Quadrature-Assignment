function out = Sc(f, a, b, N)
% Sc(f, a, b, N)
% This function calculates the integral of f on the interval [a,b]
% using the Composite Simpson rule with N subintervals

    % Partition [a,b] into N subintervals
    points = linspace(a, b, N + 1) ;
    
    % Evalulate f at the end points of the N subintervals
    fx = f(points);

    % Define the length of a subinterval
    h = ((b - a) / N); 
    
    % Apply the composite simpson rule
    out = (h/3.0) * (fx(1) + (4 * sum(fx(2:2:N))) + (2 * sum(fx(3:2:N))) + fx(N+1));
end
