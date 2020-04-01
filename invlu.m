function[matrix_inv, x] = invlu(A, b);

%%make sure matrix is square
[m,n]=size(A);
if m~=n, error('Matrix A must be square');
end 

if det(A)< 0.1, error('Matrix is singular or ill conditioned') 
end 

%%determining L and U
[L,U] = lu(A);

%%finding inverse
%% A inverse = L inverse * U inverse
L_inv = inv(L);
U_inv = inv(U);

matrix_inv = (inv(U)*inv(L))

check = (matrix_inv)*(A)

%% x=A^-1*b
x = (matrix_inv)*(b)




