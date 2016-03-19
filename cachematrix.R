## makeCacheMatrix creates a matrix and set/get its inverse


## The first function creates a list with methods that set and get a matrix and its inverse in an intrinsic environment variable

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL ## value undefined
    set <- function(y) {
        x <<- y ## assigned object to a different environment
        s<<- NULL
    }

## 
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function()s
    list(set = set, get = get,setsolve = setsolve,getsolve = getsolve)
}


## The function will check in there's a cached matrix otherwise will get the matrix

cacheSolve <- function(x, ...) {
    s <- x$getsolve()
      if(!is.null(s)) {
            message("obtaining cached data")
            return(s)
          }
      data <- x$get()
      s <- solve(data, ...)
      x$setsolve(s)
      s
    } 
       
