##Stores an inverted matrix and 4 functions in an object. 
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


##Inverts a matrix and stores the result in the makeCacheMatrix object. 
cacheSolve <- function(x) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        } 
        data <- x$get()  
        m <- solve(data)
        x$setsolve(m)
        m
}
