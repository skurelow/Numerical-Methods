function x = gausspivot(A,b)
%% A = coefficient matrix
%% b = right hand side vector
%% x = solution vector

[m,n] = size(A);
if m~=n, error('Matrix A must be square');
end 

nb = n + 1 ;
Aug = [A b];

%% forward elimination

for k = 1:n-1
    %%partial pivoting
    [big,i] = max(abs(Aug(k:n,k)));
    ipr = i + k - 1;
    if ipr ~= k
        Aug([k,ipr],:)=Aug([ipr,k],:);
    end 
    for i = k + 1:n
        factor = Aug(i,k)/Aug(k,k);
        Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);
    end 
end 

%% back subsitituion

x = zeros(n,1);
x(n)=Aug(n,nb)/Aug(n,n);
for i = n-1:-1:1
    x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
end 

