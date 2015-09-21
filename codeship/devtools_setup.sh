#!/bin/sh

mkdir $R_LIBS
Rscript -e 'install.packages(c("XML", "RCurl"), repos="http://cran.rstudio.com/")'
wget https://cran.r-project.org/src/contrib/Archive/rversions/rversions_1.0.0.tar.gz
Rscript -e 'install.packages("rversions_1.0.0.tar.gz", repos=NULL, type="source")'
Rscript -e 'install.packages("devtools", repos="http://cran.rstudio.com/")'

