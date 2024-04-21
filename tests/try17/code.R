foo <- function () {
    lapply(1:25, function(i) {
        # Load the boot library
        library(boot)

        # Generating some random data
        data <- rnorm(1000)

        # Defining a simple statistic function
        statistic <- function(data, indices) {
          mean(data[indices])
        }

        # Timing the bootstrapping process
        start_time <- Sys.time()
        results <- boot(data, statistic, R=10000)
        end_time <- Sys.time()
    })
}


..my_profile.. <- function (...) {
    foo()
}

..my_profile..(foo)