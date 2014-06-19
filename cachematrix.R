## First we make a special function to calculate
## inverse and then a cache function

##makeCacheMatrix is a function to compute and set inverse

makeCacheMatrix <- function(x = matrix()) {


m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

##cacheSolve will first look for a cached value in the above list

cacheSolve <- function(x, ...) {
        ## solve function will get inverse of x
        
         m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
