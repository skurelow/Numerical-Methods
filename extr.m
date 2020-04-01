%%this function assumes that if we pick enough random points over the
%%interval, that we will determine all optimal points on the interval.
%%if the optimum point isnt on the interval, program says the method
%%diverges. the user will go through the output data to determine the
%%local and global extrema found. global extrema will have highest or
%%lowest func(optimal).  user must compare output data to determine the
%%cases in which this is true

%%maxit is how many random points you want to test
%%xmin and xmax are the bounds
function[glob, local] = extr(xmin,xmax,maxit)

a = xmin;
b = xmax;
i=1;
f5 = @(x)2*sin(x)+(2*exp((-.5*x^2)+1))

%%plots function
fplot(f5)
xlim([xmin xmax])
ylim([-10 10])
xlabel('X')
ylabel('Y')
title('Function 5, Problem 4')

%%loop for determining all extrema
for i=i:maxit
disp('-----Iteration-------')
disp(i)
%%creates random value on interval for newtons method to start at
x0=a+(b-a)*rand(1,1);

%%runs newton optimization for random value. returns opt point for that
%%random value
newtopt(f5, xmin, xmax, x0, 10^-8, 100); 

%%iteration counter
i=i+1;

end



