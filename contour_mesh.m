x = linspace(-10,10);
y = linspace(-10,10);
[X,Y]=meshgrid(x,y);
 
f1 = (X.*2*Y.^2) + (X.*2) - (X.^2 -2*Y.^2);
f2 = (.3333333*X.^3)+(.5*Y.^2)-(X.*Y.*2)+(X.*4);

figure
contour(X,Y,f1)

figure
mesh(X,Y,f1)

figure
contour(X,Y,f2)

figure
mesh(X,Y,f2)
