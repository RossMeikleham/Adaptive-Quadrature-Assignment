function out = Sa(f, a, b, eps)
% Sa(f, a, b, eps)
% This function calculates the integral of f on the interval [a,b]
% using the Adaptive Simpson rule with a given error (epsilon) value

    % Calculate mid-point c
    c = (a + b)/2;

    % Obtain first integral approximation using simple simpson's rule
    h1 = (c - a);
    Q1  = (h1/3) * (f(a) + (4 * f(c)) + f(b));

    % Obtain second integral approximation using 2n + 1 nodes
    Q2 =  Sc(f, a, b, 2);

    % Estimate the error
    err = (Q2 - Q1) / 15.0;
    
    % Check if error estimate is less than the tolerance eps.
    % if it is, then Q2 is an appropriate estimate, and is returned.
    % Otherwise we split [a,b] into two equal subintervals and repeat
    % this process over each subinterval with tolerances adjusted to eps/2
    if abs(err) < eps
        out =  Q2; 
    else
        out = Sa(f, a , c, eps/2.0) + Sa(f, c, b, eps/2.0);
    end
end
