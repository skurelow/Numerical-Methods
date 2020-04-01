func = @(x)(x(1)^2)+(2*x(2)^2)+(2*x(1)*x(2))+(2*x(1))+1;
const=@d
const2=@e

b = fmincon(func,[0,0],[],[],[1,1],2)
c = fmincon(func,[0,0],[],[],[],[],[-3,0],[-1,0])
d = fmincon(func,[0,0],[],[],[1,0],3,[],[],const)
e = fmincon(func,[0,0],[],[],[1,0],2,[],[],const2)

