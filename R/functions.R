
# TODO: make this automatically if possible
# TODO: more function info perhaps?
functions <- list(
  ackley=list(function=ackley,
              domain=list(min=-5, max=5)),
  rosenbrock=list(function=rosenbrock,
                  domain=list(min=-5, max=5)),
  sphere=list(function=sphere,
              domain=list(min=-5, max=5)),
  schwefel=list(function=schwefel,
                domain=list(min=-5, max=5)),
  zakharov=list(function=zakharov,
                domain=list(min=-5, max=5))
)

get_info <- function(fun.name) {
  # TODO: check for correct name
  functions[[fun.name]]
}
