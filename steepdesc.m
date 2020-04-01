function[opt_point, fxn_opt] = steepdesc(func,x0,y0,ea, maxiter)
x=x0;
y=y0;
i=1;

while(1)
    syms x y
    grad = jacobian(func,[x,y]);  %%gradient
    gradpt=transpose(subs(grad, {x,y},{x0,y0})); %%gradient at point
    d = -(gradpt); %%direction vector
    
    syms h
    pt1 = [x0,y0]+[d(1)*h, d(2)*h];  %%new point
    
    g = func(pt1(1),pt1(2)); %%g
    g_handle = matlabFunction(g);
    d_g = fdiff(g_handle); %%derivative of g
    
    
    alpha = newtopt(g_handle,0,10^-8,100); %%finds where g equals zero
    
    
    pt2 = [x0,y0]+[d(1)*alpha, d(2)*alpha];  %%numerical value of new point
    
    x0=pt2(1); %%updated values
    y0=pt2(2);
    iter = i+1;
    h=alpha;
    
    gradopt = eval(transpose(subs(grad, {x,y},{x0,y0})));  %%to calculate stopping conditions
    maggradopt= (sqrt((gradopt(1)^2)+(gradopt(2)^2)));
    
    if maggradopt < ea||iter>maxiter  %%stopping conditions
        opt_point = eval(pt2);
        iter = iter;
        fxn_opt = eval(func(pt2(1),pt2(2)));
        format long g
        disp('Optimal Point')
        disp(opt_point)
        disp('Iterations')
        disp(iter)
        disp('Function Value at Optimal')
        disp(fxn_opt)
        break
    
    else
        x0=pt2(1);
        y0=pt2(2);
    end 
   
end 
    
    
    
    


