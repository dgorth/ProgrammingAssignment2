## These functions make a matrix with cached vaules
## and solves for or calls the inverse

## further comments are included in code

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y 
    inv <<- NULL ## initiates inv
  }
  get <- function() x ## prints matrix 
  setInv <- function(solve) inv <<- solve 
  getInv <- function() inv ## prints inv
  list(set = set, ## names set() "set"
       get = get, ## names get() "get"
       setInv = setInv, ## names setInv "setInv"
       getInv = getInv) ## names getInv "getInv"
}


## This function either retrieves the cached value or 
## if this value doesn't exists find inverse
## further comments are included in code

cachSolve <- function(x, ...) {
  m <- x$getInv() ## defines m as the value from matrix 
  if(!is.null(m)) { ## checks if it exists
    message("i got you") ## prints message 
    return(m)
  }
  p <- x$get() ## retrieve the matrix
  m <- solve(p) ## actually calcualte inverse here
  x$setInv(m) ## define Inv as solution
  m #prints m
}
