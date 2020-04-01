x = -100:1:100;

f1 = sin(x) - (x.^3);
plot(x,f1)
ginput(1)