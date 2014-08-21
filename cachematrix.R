# Example usage:
# > x <- matrix(rnorm(16), nrow = 4)  // create a matrix
# > y <- makeCacheMatrix(x)           // create a list of accessor functions/methods 
# > y$get()                           // Return the matrix
# > cacheSolve(y)                     // Return inverse matrix
# > cacheSolve(y)                     // Return inverse matrix with cached data



# Returns a list of functions that are accessor functions/methods and caches matrix and inverse matrix.  
# set matrix
# get matrix
# set inverse matrix
# get Inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  # sets m to Null
  m <- NULL
  # Setter for the matrix
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  # Getter for Matrix
  get <- function(){
    x
  }
  # Setter for inverse matrix
  setmatrix <- function(solve){
    m <<- solve
  }
  # Getter for inverse matrix
  getmatrix <- function(){
    m
  } 
  # Return list of getters and setters
  list(set = set, get = get, setmatrix = setmatrix, getmatrix = getmatrix)
}


# cacheSolve returns the caculated inverse of a matrix.  If the inverse
# matrix is calculated, returns cached inverse matrix. If the inverse matrix
# is not calculated, it calculates, caches and returns the inverse matrix

cacheSolve <- function(x, ...) {
  # gets the cached inverse matrix 
  m <- x$getmatrix()
  # If matrix exists, return cached inverse matrix
  if(!is.null(m)){
    message("Getting cached data")
    return(m)
  }
  # get matrix
  matrix <- x$get()
  # calculates inverse of matrix
  m <- solve(matrix, ...)
  # sets the inverse matrix
  x$setmatrix(m)
  # returns inverse matrix
  m
}
