%%user muest input anonoymous function into command window and use the name
%%of that function as the input value func.

function [root, fx, ea, iter] = bisect(func,xl,xu,es,maxit,varargin)

if nargin<3, error('at least 3 input arguments required'), end

%%tests sign change
test = func(xl, varargin{:})*func(xu,varargin{:});
if test>0, error('no sign change'), end

if nargin<4|isempty(es), es=0.0001; end
if nargin<5|isempty(maxit), maxit=50; end

%%sets up initial conditions
iter = 0; 
xr=xl;
ea=100;

%%iteration loop
while (1)
    xrold = xr;
    xr = (xl+xu)/2;
    iter = iter+1;
    
    if xr ~=0
        ea=abs((xr-xrold)/xr)*100; %%calculates error
    end 
    
    %%sets up values for next iteration
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0 
        xu=xr;
    elseif test >0
        xl=xr;
    else ea =0;
    end 
    
  %%stopping conditions
    if ea < es||iter>=maxit
        root = xr;
        iter=iter;
        break
    end
    
end 

Output=[root, ea, iter]