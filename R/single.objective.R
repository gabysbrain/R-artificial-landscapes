
# multi-D single objective optimization functions

# n.b. all these should be vectorized!

rosenbrock <- opt.vect(function(x) {
  xi = x[1:(length(x)-1)]
  xi.1 = x[2:length(x)]
  sum((1-xi)**2 + 100 * (xi.1 - xi**2)**2)
})

spherical <- opt.vect(function(x) {
  sum(x**2)
})

schwefel <- opt.vect(function(x) {
  418.9829 * length(x) - sum(x*sin(sqrt(abs(x))))
})

sinc <- opt.vect(function(x) {
  prod(ifelse(x!=0,sin(x)/x,1))
})

ackley <- opt.vect(function(x) {
  a=20
  b=0.2
  c=2*pi
  -a * exp(-b * sqrt(1/length(x) * sum(x**2))) - 
    exp(1/length(x) * sum(cos(c*x))) + a + exp(1)
})

zakharov <- opt.vect(function(x) {
  sum(x**2) + (sum(0.5 * x * (1:length(x))))**2 + 
    (sum(0.5 * x * (1:length(x))))**4
})



