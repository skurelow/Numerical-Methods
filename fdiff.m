% Computes the derivative of a function
% Input (func): An anonymous or inline function
% Output (dfunc): An inline function that is the derivative of func
function dfunc = fdiff(func)
syms h;                         % define a symbol
symf = feval(func,h);           % generate symbolic expression
deriv = diff(symf,h);           % take derivative
dfunc = inline(deriv);    % generate function