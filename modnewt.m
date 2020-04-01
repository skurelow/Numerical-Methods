%%user muest input anonoymous function into command window and use the name
%%of that function as the input value func.

function[root, iter] = modnewt(func, x0, es, maxit)

%%checks function inputs
if nargin<3, error('at least 3 input arguments required'), end
if nargin<4|isempty(es), es=0.0001; end
if nargin<5|isempty(maxit), maxit=50; end

%%initial conditions
xr=x0;
ea=100;
iter=0;
d_func = fdiff(func);
d2_func = fdiff(d_func);

%%iteration loop
while(1)
    xrold=xr;
    xr = (xrold)-(func(xrold)*(d_func(xrold)))/((d_func(xrold)^2)-(func(xrold)*d2_func(xrold)));
    iter = iter+1;
    
    if xr~=0
        ea = abs((xr - xrold)/xr)*100; %%calculates error
    end
    
    %%stopping conditions
    if ea <es||iter>=maxit
        root = xr;
        iter=iter;
        break
    end 
   
end

format long g
Output=[root, ea, iter]  
    