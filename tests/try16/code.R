foo <- function () {
    lapply(1:25, function(i) {
        # Generating a large vector with random data
        large_vector <- runif(10000000)

        # Timing the sort operation
        start_time <- Sys.time()
        sorted_vector <- sort(large_vector)
        end_time <- Sys.time()
    })
}


..my_profile.. <- function (...) {
    foo()
}

..my_profile..(foo)