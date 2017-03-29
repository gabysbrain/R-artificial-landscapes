
# the way I want to vectorize is a bit different from the standard 
# Vectorize function

opt.vect = function(FUN, ...) {
  Vectorize(FUN, vectorize.args=c("x"))
  dots = list(...)
  # print(dots)
  function(x) {
    if(is.null(dim(x))) {
     # if(length(as.list(formals(FUN)))>1) {
      #  FUN(x, dots)
      # } else {
         FUN(x)
      # }
    } else {
     # if(length(as.list(formals(FUN)))>1) {
      #   apply(x, 1, FUN, dots)
      # } else {
          apply(x, 1, FUN)
      #}
    }
  }
}

