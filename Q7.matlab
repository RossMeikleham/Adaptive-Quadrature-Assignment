% ID:1107023
function q7()
% Matlab File for Question 7 to generate both graphs
% For Adaptive Simpson`s and Composite Simpsons`

    % Function used in Q7
    f = @(x) sin(1 - (24 * erf((x - 1)/(0.2 * sqrt(2)))));

    % Evaluate X and Y points of function to plot on graph
    x = linspace(0, 2, 10^4);
    y = f(x);

    % Calculate Adaptive X points for given epsilon
    epsilon = 10^(-3);
    adaptiveX= adaptive_simpson_points(f,0,2,epsilon);

    % Calculate Composite X points.
    % Calculate same number of points as the Adaptive
    % formula does, ensure we don't count duplicate points
    % from adaptive, and we can use linspace since Composite
    % Simpsons' points are linearly spaced
    num = unique(numel(adaptiveX));
    compositeX = linspace(0, 2, (num - 1)/2);


    % Plot Adaptive graph
    figure
    plot(x,y)
    hold on
    % Place x values on y = - 1.1 so it
    % is easier to see the spacing
    plot(adaptiveX,-1.1, 'r+')
    axis([0,2,-1.2,1])

    % Plot Composite graph
    figure
    plot(x,y)
    hold on
    % Place x values on y = - 1.1 so it
    % is easier to see the spacing
    plot(compositeX, -1.1, 'r+')
    axis([0,2,-1.2,1])
end

function out = adaptive_simpson_points(f, a, b, eps)
% adaptive_simpson_points(f, a, b, eps)
% This function works out the integration nodes of f on the interval [a,b]
% using the Adaptive Simpson rule with a given error (epsilon) value

    % Calculate mid-point c
    c = (a + b)/2;

    % Obtain first integral approximation using 3 nodes
    Q1  = Sc(f, a, b, 1);

    % Obtain second integral approximation using 5 nodes
    Q2 =  Sc(f, a, b, 2);

    points = linspace(a, b, 4); 
    
    % Estimate the error
    err = (Q2 - Q1) / 15.0;
    
    % Check if error estimate is less than the tolerance eps.
    % if it is, then Q2 is an appropriate estimate, and is returned.
    % Otherwise we split [a,b] into two equal subintervals and repeat
    % this process over each subinterval with tolerances adjusted to eps/2
    if abs(err) < eps
        out = points; 
    else
        out = horzcat(points, Sa2(f, a , c, eps/2.0),  Sa2(f, c, b, eps/2.0));
    end
end
