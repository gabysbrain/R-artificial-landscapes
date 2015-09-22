

# optim-functions

[![Build Status](https://travis-ci.org/gabysbrain/R-optim-functions.svg?branch=master)](https://travis-ci.org/gabysbrain/R-optim-functions)
[![codecov.io](http://codecov.io/github/gabysbrain/R-optim-functions/coverage.svg?branch=master)](http://codecov.io/github/gabysbrain/R-optim-functions?branch=master)

A number of standard optimization functions for R along with sampling methods.
There is a unified interface to sampling the functions. One can run
`sample.func("rosenbrok", n=250, k=5, method="lhs.sampling")` to get a 250
sample Latin hypercube in 5D of the rosenbrock function. 

