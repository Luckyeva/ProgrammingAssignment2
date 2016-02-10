## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## this function assigns NULL value to the cached variable "im"
## and creates 4 functions
## - function set() assigns new value to matrix x
## - function get() returns matrix x as it is
## - function setmatrix() assigns the inverse matrix to cache "im"
## - function getmatrix() returns cached variable "im"

makeCacheMatrix <- function(x = matrix()) {
  		im <- NULL
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        get <- function() x
        setmatrix <- function(imatrix) im <<- imatrix
        getmatrix <- function() im
       
        list(set = set, get = get, setmatrix = setmatrix, getmatrix = getmatrix)
        
}


## Write a short comment describing this function
## THis function returns the inverse matrix of x from the cache if 
## "im" is not NULL, or compute the inverse of matrix x if "im" is 
## NULL

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         im <- x$getmatrix()
        if (!is.null(im)) {
                message("getting cached data")
                return(im)
        } 
        data <- x$get()
        im <- solve(data)
        x$setmatrix(im)
        im
}

##  Examples

x <- makeCacheMatrix(matrix(1:4, 2, 2))
cacheSolve(x)
cacheSolve(x)

y <- matrix(5:8, 2, 2)
x$set(y)
cacheSolve(x)
cacheSolve(x)


