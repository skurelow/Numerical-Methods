fprintf('\n\n24-311 S20 Assignment_3');
fprintf('\nSarah_Kurelowech\n');
fprintf('\nskurelow@andrew.cmu.edu\n');


%--------------------------------Problem#4.4---------------------------------
fprintf('\nProblem#4.4:\n');

epsilon = 1;

%%step 2 fails, step 3, tests step 2 again
while 1+epsilon > 1 
    epsilon = epsilon/2;   
end

%%step 2 passes, step 5
epsilon = 2*epsilon

%%now using the eps function built into matlab
matlab_epsilon = eps

%--------------------------------Problem#4.10---------------------------------
fprintf('\nProblem#4.10: see part a and b on PDF, this is just code I used to help me\n');
%%taylor approximation of e^-x_i

%%constant values
x_i_plus_1 = 1;
x_i = 0.25;
h = x_i_plus_1 - x_i;

%%zero order
func_approx_0 = exp(-x_i);
error_zero = 100*abs((exp(-1)-func_approx_0)/(exp(-1)));

%%first order
func_approx_1 = exp(-x_i) - exp(-x_i)*h;
error_first=100*abs((exp(-x_i_plus_1)-func_approx_1)/(exp(-x_i_plus_1)));

%%second order
func_approx_2 = exp(-x_i) - exp(-x_i)*h + (exp(-x_i)*h^2)*(1/factorial(2));
error_second = 100*abs((exp(-x_i_plus_1)-func_approx_2)/(exp(-x_i_plus_1)));

%%third order
func_approx_3 = exp(-x_i) - exp(-x_i)*h + (exp(-x_i)*h^2)*(1/factorial(2)) - (exp(-x_i)*h^3)*(1/factorial(3));
error_third = 100*abs((exp(-x_i_plus_1)-func_approx_3)/(exp(-x_i_plus_1)));

%%results vector
approximation_410 = [func_approx_0 func_approx_1 func_approx_2 func_approx_3]
error_percent_410 = [error_zero error_first error_second error_third]


%--------------------------------Problem#4.13---------------------------------
fprintf('\nProblem#4.13: See PDF, just wrote code for assistance \n');

%%taylor approximation of function 25x^3 - 6x^2 +7x - 88

%%constants
x_i_plus_1 = 3;
x_i = 1;
h = x_i_plus_1 - x_i;
f_(3) = 25*(3)^3 - 6*(3)^2 +7*(3)-88;

%%zero order
approx_0 = 25*(x_i)^3 - 6*(x_i)^2 +7*(x_i) -88;
error_0 = 100*((f_(3)-approx_0)/(f_(3)));

%%first order
approx_1 = (25*(x_i)^3 - 6*(x_i)^2 +7*(x_i) -88)+(75*(x_i)^2-12*x_i+7)*(h);
error_1 = 100*((f_(3)-approx_1)/(f_(3)));

%%second order
approx_2 = (25*(x_i)^3 - 6*(x_i)^2 +7*(x_i) -88)+((75*(x_i)^2-12*x_i+7)*(h))+(150*x_i-12)*(h^2)*(1/factorial(2));
error_2 = 100*((f_(3)-approx_2)/(f_(3)));

%%third order
approx_3 = (25*(x_i)^3 - 6*(x_i)^2 +7*(x_i) -88)+((75*(x_i)^2-12*x_i+7)*(h))+((150*x_i-12)*(h^2)*(1/factorial(2)))+(150*h^3*(1/factorial(3)));
error_3 = 100*((f_(3)-approx_3)/(f_(3)));

%%result vectors
approximation = [approx_0 approx_1 approx_2 approx_3]
error_percent = [error_0 error_1 error_2 error_3]


%--------------------------------Problem#4.16/4.17----------------------------
fprintf('\nProblem#4.16/4.17: See handwritten PDF, code just written for assistance\n');  

%%step size 
%%change for problem 4.17
h = 0.25;

%%points
%setting x_i as 2
x_i = 2;
x_i_plus_1 = x_i+h;
x_i_minus_1 = x_i - h;

%%derivatives evaluated at x_i
d_at_point = 75*(x_i^2) - 12*x_i +7;
d2_at_point = 150*(x_i) - 12;

%%function evaluated at x_i
f_x_i_plus_1 = (25*(x_i_plus_1)^3) - (6*(x_i_plus_1)^2) +(7*(x_i_plus_1)) -(88);
f_x_i = (25*(x_i)^3) - (6*(x_i)^2) +(7*(x_i)) -(88);
f_x_i_minus_1 =(25*(x_i_minus_1)^3) - (6*(x_i_minus_1)^2) +(7*(x_i_minus_1)) -(88);

%%for second derivatives
f_x_i_plus_2h = (25*(x_i_plus_1+h)^3) - (6*(x_i_plus_1+h)^2) +(7*(x_i_plus_1+h)) -(88);
f_x_i_minus_2h = (25*(x_i_minus_1-h)^3) - (6*(x_i_minus_1-h)^2) +(7*(x_i_minus_1-h)) -(88);


%%%%%%%%forward difference%%%%%%%%%%%

%first derivative
d_forward = (f_x_i_plus_1 - f_x_i)/h;
error_forward_d = 100*abs((d_at_point-d_forward)/(d_at_point));

%2nd derivative
d2_forward = ((f_x_i_plus_2h) - (2*f_x_i_plus_1) + (f_x_i))/(h^2);
error_forward_d2 = 100*abs((d2_at_point-d2_forward)/(d2_at_point));


%%%%%%%%%backwards difference%%%%%%%%%%%

%first derivative
d_backwards = (f_x_i - f_x_i_minus_1)/h;
error_backwards_d = 100*abs((d_at_point-d_backwards)/(d_at_point));

%second derivative
d2_backwards = (f_x_i - 2*f_x_i_minus_1 + (f_x_i_minus_2h))/(h^2);
error_backwards_d2 = 100*abs((d2_at_point-d2_backwards)/(d2_at_point));


%%%%%%%centered difference%%%%%%%%%

%first derivative
d_centered = (f_x_i_plus_1 - f_x_i_minus_1)/(2*h);
error_centered_d = 100*abs((d_at_point-d_centered)/(d_at_point));

%second derivative
d2_centered = (f_x_i_plus_1 - 2*f_x_i + f_x_i_minus_1)/(h^2);
error_centered_d2 = 100*abs((d2_at_point-d2_centered)/(d2_at_point));

%%vectors
First_Derivative_Errors = [error_forward_d error_backwards_d error_centered_d]
Second_Derivative_Errors = [error_forward_d2 error_backwards_d2 error_centered_d2]

First_Derivatives = [d_forward d_backwards d_centered]
Second_Derivatives = [d2_forward d2_backwards d2_centered]

%--------------------------------Problem#4.19---------------------------------
fprintf('\nProblem#4.19: See handwritten PDF\n');  


%--------------------------------Problem#4.20---------------------------------
fprintf('\nProblem#4.20: See handwritten PDF, output figures PDF\n');  






