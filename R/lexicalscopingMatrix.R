# Assignment: Caching the Inverse of a Matrix
#
# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(m = matrix()) {

  i <- NULL
  set <- function(x) {
    m <<- x
    i <<- NULL
  }
  get <- function() m
  setInv <- function(x) i <<- x
  getInv <- function() i
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), then 
# the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(m, ...) {
  x <- m$getInv()
  if (!is.null(x)) {
    message("cached data")
    return(x)
  }
  m$setInv(solve(m$get()))
  m$getInv()
}
