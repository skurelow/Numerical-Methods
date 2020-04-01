function[opt_point, fxn_opt] = newt2d(func,x0,y0,es,maxiter)

format long g
x=x0;
y=y0;
syms x y
func=func;
iter=1;

while(1)
    grad = jacobian(func,[x,y]); %%gradient vector
    gradpt=(transpose(subs(grad, {x,y},{x0,y0}))); %%gradient at point
    hess = jacobian(grad,[x,y]);  %%hessian matrix
    
    H = inv(hess); %%inverse hessian
    Hpt=(subs(H,{x,y},{x0,y0})); %%inverse hessian at point
    
    A=eval((Hpt)*(gradpt));%%hessian at point times gradient at point
    
    x_opt = ([x0,y0] -[A(1),A(2)]);  %%optimal point
    
    gradopt = transpose(subs(grad, {x,y},{x_opt(1),x_opt(2)}));  %%for stopping conditions
    maggradopt= sqrt((gradopt(1)^2)+(gradopt(2)^2));
    
    %%stopping conditions
    if maggradopt <es|iter>=maxiter
        opt_point= x_opt;
        fxn_opt = func(x_opt(1),x_opt(2));
        break 
    end 
    
    x0=x_opt(1);
    y0=x_opt(2);
    iter=iter+1;
end 
disp('Optimal Point')
disp(opt_point)
disp('Function Value at Optimal Point')
disp(fxn_opt)
disp('Iterations')
disp(iter)


