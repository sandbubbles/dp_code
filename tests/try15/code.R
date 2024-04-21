foo <- function () {
    lapply(1:25, function(i) {
        # Generating two large matrices
        matrix1 <- matrix(rnorm(1000*1000), nrow=1000)
        matrix2 <- matrix(rnorm(1000*1000), nrow=1000)

        # Timing the matrix multiplication
        start_time <- Sys.time()
        result <- matrix1 %*% matrix2
        end_time <- Sys.time()
    })
}


..my_profile.. <- function (...) {
    foo()
}

..my_profile..(foo)