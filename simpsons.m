function res =  Sc(f, a, b, N)
    h = ((b - a) / N) %Step Length
    singleTerms = f(a) + f(b)
    

    xTerms = arrayFun(@(j), a + (j * h), 1:n:1) 
    res = sum(xTerms)
   %% doubleTerms = 2 * sum((arrayFun(@(x) mod(x, 2) * f(x), 
   %% terms = arrayfun(@(x) if mod(x, 2) == 0  


