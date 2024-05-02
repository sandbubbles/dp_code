#testme.py from scalene
..my_profile.. <- function (...) {
# Define the functions as in the original Python script
doit1 <- function(x) {
  y <- 1
  x <- (0:100000)[99999]
  y1 <- (0:200000)[199999]
  z1 <- (0:200000)[299999]
  z <- x * y * y1 * z1
  return(z)
}

doit2 <- function(x) {
  i <- 0
  z <- 0.1
  while (i < 100000) {
    z <- z * z
    z <- x * x
    z <- z * z
    z <- z * z
    i <- i + 1
  }
  return(z)
}

doit3 <- function(x) {
  z <- x + 1
  z <- x + 1
  z <- x + 1
  z <- x + z
  z <- x + z
  return(z)
}

stuff <- function() {
  x <- 1.01
  for (i in 1:9) {
    cat(i, "\n")
    for (j in 1:9) {
      x <- doit1(x)
      x <- doit2(x)
      x <- doit3(x)
      x <- 1.01
    }
  }
  return(x)
}

print("TESTME\n")
stuff()
}
..my_profile..()