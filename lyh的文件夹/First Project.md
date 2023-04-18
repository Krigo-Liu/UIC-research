# Task - 1
- [x] Draw the diagram for $$f(x)=\sin(x)$$
- [x] Cut $[a,b]$ into a set of $n_{x}$ intervals $[x_{j- \frac{1}{2}},x_{j+ \frac{1}{2}}]$, where $x_{j}={x_{j- \frac{1}{2}}+x_{j+ \frac{1}{2}}}$
- [x] Plot $\hat{f(x)} = f(x_{j)}|_{I_{j}}$
- [ ] Gaussian integral and Gaussian points.
	- [[Hoover Gaussian integral and Gaussian points]]
```matlab
function integral = Gaussian_integral(fun,a,b,n)
h = (b-a)/n;
x = [];
for j=1:n
x(j) = (a+a+h)/2;
a = a+h;
integral(j) = fun(x(j));
end
end
```

# Task - 2
Suppose $$\frac{1}{{\Delta t}}\int I_{j}f(x)dx \approx \frac{1}{{\Delta t }}\sum\limits_{ig=1}^{6}f(x_{i,ig};)$$
