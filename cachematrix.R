##These 2 functions inverts a matrix and caches it. 
##If a matrix is already cached it wont be caclulated again.

##Creates an object which stores 4 functions and an inverted matrix as the result of the cachematrix function. 

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
        } else{message("inverting matrix...")
        data <- x$get()  
        m <- solve(data)
        x$setsolve(m)
        m
}
}
