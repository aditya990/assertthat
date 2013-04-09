base_fs <- new.env(parent = emptyenv())

is_not <- function(thing) {
  function(call, env) {
    paste0(deparse(call[[2]]), " is not ", thing)
  }
}

# Vectors
base_fs$is.atomic <- is_not("an atomic vector")
base_fs$is.character <- is_not("a character vector")
base_fs$is.complex <- is_not("a complex vector")
base_fs$is.double <- is_not("a numeric vector")
base_fs$is.integer <- is_not("a numeric vector")
base_fs$is.numeric <- is_not("a numeric or integer vector")
base_fs$is.raw <- is_not("a raw vector")
base_fs$is.vector <- is_not("an atomic vector without attributes")

# Factors
base_fs$is.factor <- is_not("a factor")
base_fs$is.ordered <- is_not("an ordered factor")

# More complicated data structures
base_fs$is.array <- is_not("an array")
base_fs$is.data.frame <- is_not("a data frame")
base_fs$is.list <- is_not("a list")
base_fs$is.matrix <- is_not("a matrix")
base_fs$is.null <- is_not("NULL")

# Functions and environments
base_fs$is.environment <- is_not("an environment")
base_fs$is.function <- is_not("a function")
base_fs$is.primitive <- is_not("a primitive function")

# Computing on the language
base_fs$is.call <- is_not("a quoted call")
base_fs$is.expression <- is_not("an expression object")
base_fs$is.name <- is_not("a name")
base_fs$is.pairlist <- is_not("a pairlist")
base_fs$is.recursive <- is_not("a recursive object")
base_fs$is.symbol <- is_not("a name")

base_fs$file.exists <- function(call, env) {
  path <- eval(call[[2]], env)
  paste0("Path '", path, "' does not exist")
}

base_fs$"==" <- function(call, env) {
  lhs <- paste(deparse(call[[2]]), collapse = "")
  rhs <- paste(deparse(call[[3]]), collapse = "")
  paste0(lhs, " does not equal ", rhs)
}
