%%user muest input anonoymous function into command window and use the name
%%of that function as the input value func.

function[root, iter] = modsecmeth(func, x0,pert, es, maxiter)

%%initial conditions
f0=func(x0);
f1=func(x0+(pert*x0));
i=2;
ea=100;
xr=x0;

%%iteration loop
while i <= maxiter
    xrold=xr;
    xr = (x0)-((pert*x0)*f0)/(f1-f0);
    
    if xr~= 0
        ea = abs((xr-xrold)/xr)*100; %%calculates error
    end 
    
    if ea < es||i>maxiter
        xr=xr;
        i=i;
        break
    else 
        i=i+1;
        x0=xr;
        f0=func(xr);
        f1=func(xr+(pert*xr));
    end
   
    
end
format long g
output = [xr, ea,i]