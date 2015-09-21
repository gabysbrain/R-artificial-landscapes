#!/bin/sh

wget https://cran.r-project.org/src/contrib/Archive/testthat/testthat_0.8.1.tar.gz
Rscript -e 'install.packages("testthat_0.8.1.tar.gz")'
