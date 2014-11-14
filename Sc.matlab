function out = Sc(f, a, b, N)
% Sc(f, a, b, N)
% This function calculates the integral of f on the interval [a,b]
% using the Composite Simpson rule with N subintervals, the supplied N
% value should be even

    % Shorthand for double the ino of subintervals
    N2 = 2 * N;
    % Generate 2N + 1 equally spaced nodes
    points = linspace(a, b,  N2 + 1) ;
    
    % Evalulate f at each node
    fx = f(points);

    % Define the distance between each node
    h = ((b - a) / N2); 
    
    % Apply the composite simpson rule
    odd_terms  =  sum(fx(2:2:N2));
    even_terms =  sum(fx(3:2:N2));
    out = (h/3.0) * (fx(1) + (2 * even_terms) + (4 * odd_terms) + fx(N2+1));
                    
end
