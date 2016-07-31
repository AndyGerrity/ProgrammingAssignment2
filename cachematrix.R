## Put comments here that give an overall description of what your
## functions do

## creates an empty matrix with which to store data in from the below function

makecachematrix <- function(x = matrix()) {
  inver <- NULL
  set <- function(y) {
    x <<- y
    inver <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inver <<- inverse
  getinverse <- function() inver
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## creates an inverse of the matrix and stores it in cache once done for easier retreival

cachesolve <- function(x, ...) {
  inver <- x$getinverse()
  if(!is.null(inver)) {
    message("getting cached data")
    return(inver)
  }
  data <- x$get()
  inver <- solve(data, ...)
  x$setinverse(inver)
  inver
}
##TEST##
x = rbind(c(1,4),c(2,7))
> 
  > makecachematrix <- function(x = matrix()) {
    +     inver <- NULL
    +     set <- function(y) {
      +         x <<- y
      +         inver <<- NULL
      +     }
    +     get <- function() x
    +     setinverse <- function(inverse) inver <<- inverse
    +     getinverse <- function() inver
    +     list(set = set, 
               +          get = get,
               +          setinverse = setinverse,
               +          getinverse = getinverse)
    + }
> 
  > cachesolve <- function(x, ...) {
    +     inver <- x$getinverse()
    +     if(!is.null(inver)) {
      +         message("getting cached data")
      +         return(inver)
      +     }
    +     data <- x$get()
    +     inver <- solve(data, ...)
    +     x$setinverse(inver)
    +     inver
    + }
> m = makecachematrix(x)
> m$get()
[,1] [,2]
[1,]    1    4
[2,]    2    7
> cachesolve(m)
[,1] [,2]
[1,]   -7    4
[2,]    2   -1
> cachesolve(m)
getting cached data
[,1] [,2]
[1,]   -7    4
[2,]    2   -1
> 
