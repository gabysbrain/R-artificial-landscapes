
# the way I want to vectorize is a bit different from the standard 
# Vectorize function

opt.vect = function(FUN) {
  function(x) {
    if(is.null(dim(x))) {
      FUN(x)
    } else {
      apply(x, 1, FUN)
    }
  }
}

