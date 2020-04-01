%%user muest input anonoymous function into command window and use the name
%%of that function as the input value func.

load hw5_24311
f = disc_f

function[root, iter] = secmeth(func, x0,x1, es, maxiter)

%%initial conditions
f0=func(x0);
f1=func(x1);
i=2;
ea=100;
xr=x0;

%%iteration loop
while i <= maxiter
    xrold=xr;
    f0=func(x0);
    f1=func(x1);
    xr = xr-((f1)*(x0-x1))/(f0-f1);
    
    if xr~= 0
        ea = abs((xr-xrold)/xr)*100; %%calculates error
    end 
    
    if ea < es||i>maxiter
        root=xr;
        iter=i;
        break
    else 
        i=i+1;
        x0=x1;
        x1=xr;
        f0=f1;
        f1=func(xr);
    end
   
    
end
format long g
Output=[root, ea, iter]
end 