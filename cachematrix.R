## A pair of functions that cache the inverse of a matrix



## This function creates matrix object that cache its inverse

makeCacheMatrix <- function(x = matrix()) {

	## Initializing the inverse
	m <- NULL

	## Setting the matrix
	set <- function(y){
		x <<- y
		m <<- NULL
	}

	##Getting the matrix
	get <- function() {
		##Returning the matrix
		x		
	}

	## Setting the inverse of the matrix
	setMatrixInverse <- function(solve) {
		m <<- solve
	}

	## Getting the inverse of the matrix
	getMatrixInverse <- function() {
		## Returning the inverse
		m
	}

	## Returning the list
	list(set = set, get = get,
	     setMatrixInverse = setMatrixInverse,
	     getMatrixInverse = getMatrixInverse)

}


## Computing the inverse of the matrix that is returned by 'makeCacheMatrix'
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the below function 'cacheSolve' will fetch the inverse from
## the cache

cacheSolve <- function(x, ...) {

        ## Return a matrix that is the inverse of 'x'
	  m <- x$getMatrixInverse()

	  ## Return the inverse if already set
	  if(!is.null(m))	{
		   message("getting cached data")
		   return(m)
	  }

	  ## Getting the matrix
	  data <- x$get()

	  ## Calculating the inverse
	  m <- solve(data, ...)

	  ## Setting the inverse
	  x$setMatrixInverse(m)

	  ## Returning the matrix
	  m
	
}
