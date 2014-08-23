## THe functions below creates a special object that stores a matrix
## and caches its inverse

## This function creates a list that contains a number of methods
## to set and get the value of the matrix and to set and get the 
## inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  invrse <- NULL
  set <- function(y){
      x <<- y
      invrse <<- NULL
  }
  get <- function() {x}
  setInvrse <- function(inverse) invrse <<- inverse
  getInvrse <- function() {invrse}
  list(set=set, get=get, setInvrse = setInvrse, getInvrse=getInvrse)
}


## This function calculate the inverse of a matrix that is 
## created with the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    invrse <- x$getInvrse()
    if (!is.null(invrse)){
        message ("getting cached data")
        return(invrse)
    }
    data <- x$get()
    invrse <- solve(data)
    x$setInvrse(invrse)
    invrse
}
