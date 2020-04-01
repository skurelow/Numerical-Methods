
function secant_approx = disc(V, x0, x1, es, iter)

ea = 100;
for i = 0:iter
    %%stopping conditions
    if abs(ea) < es
        secant_approx = [x1, i];
        break
    else
        
        %%indexes 
        y0 = V.disc_f(x0);
        y1 = V.disc_f(x1);
        
        %%linear interpolation
        %%slope of secant line
        m = (y1 - y0)/(x1 - x0);
        
        %%approx root based on slope
        root = x0 - y0/m;
        
        %%rounds to nearest index
        xr = round(root);
        
        %%error calculation
        ea = ((xr - x0) / xr)*100;
        
        %%sets up values for next iteration
        x0 = x1;
        x1 = xr;
    end
end