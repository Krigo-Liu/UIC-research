function integral = Gaussian_integral(fun,a,b,n)
h = (b-a)/n;
x = [];
for j=1:n
    x(j) = (a+a+h)/2;
    a = a+h;
    integral(j) = fun(x(j));
end
end