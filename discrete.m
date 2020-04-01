

function[root, iter] = discrete(func, x0,x1, es, maxiter)

load hw5_24311
func = disc_f;

x0=50;
x1=45;

%%setting up index
x = 1:1:61;

%%initial conditions
f0=func(x0)
f1=func(x1)
i=1;
ea=100;
xr=x0;

%%iteration loop
while i <= maxiter
    xrold=xr;
    xr = xrold-((f0)*(x0-x1))/((f0)-(f1));
    xround=round(xr)
    
    if xr~= 0
        ea = abs((xr-xrold)/xr)*100; %%calculates error
    end 
    
    
    if ea < es||i>maxiter
        root=xr;
        iter=i;
        break
    else 
        i=i+1;
        x0=x(i);
        x1=xround;
       
        end
   
    
end
format long g
disp(xr)
disp(i)
disp(ea)
end 
