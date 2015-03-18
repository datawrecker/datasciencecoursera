## Caching the Inverse of a Matrix
## to avoid repetitions of the
## costly Matrix inversion computation

## Cache the matrix inverse for future retrieval
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## Retrieve the inverse of the cached matrix 'x'
cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinv(inv)
    inv
}

#mat <- matrix(sample(1:1000, 16), 4, 4)
#cm <- makeCacheMatrix(mat)
#
#message("First time to get the inverse of mat")
#inv1 <- cacheSolve(cm)
#print(inv1)
#
#message("Second time to get the inverse of mat")
#inv2 <- cacheSolve(cm)
#print(inv2)
#
#message("Update cached matrix")
#cm$set(matrix(sample(1:1000, 25), 5, 5))
#
#message("First time to get the inverse of new mat")
#inv3 <- cacheSolve(cm)
#print(inv3)
#
#message("Second time to get the inverse of new mat")
#inv4 <- cacheSolve(cm)
#print(inv4)

