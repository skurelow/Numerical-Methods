%%user muest input anonoymous function into command window and use the name
%%of that function as the input value func.

function[optimal] = newtopt(func, x0, es, maxit)

syms h

%%initial conditions
xr=x0;
ea=100;
iter=0;

d_func = fdiff(func);
d2_func = fdiff(d_func);

%%iteration loop
while(1)
    xrold=xr;
    xr = (xrold)-(d_func(xrold)/d2_func(xrold));
    iter = iter+1;
    
    if xr~=0
        ea = abs((xr - xrold)/xr)*100;%%calculates error
    end 
        
    
    %%stopping conditions
    if ea <es||iter>=maxit
        optimal = xr;
        iter=iter;
        break
    end 
end 
format long g





