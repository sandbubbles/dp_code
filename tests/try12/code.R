foo <- function() {
    start_time <- Sys.time()

    elapsed_time <- 0
    while (elapsed_time < 1) {
    result <- sum(1:100000000)
    end_time <- Sys.time()
    elapsed_time <- end_time - start_time
    }

}

bar <- function () {
    for (i in 1:5) {
        result <- sum(rnorm(1:10000000))
    }
}


..my_profile.. <- function (...) {
    lapply(1:5, function(i) {
        #print("hi")
        #start_time <- Sys.time()
#    elapsed_time <- 0
#    while (elapsed_time < 1) {
#    result <- sum(rnorm(1:10000000))
#    end_time <- Sys.time()
#    elapsed_time <- end_time - start_time
#    }
        foo()
        #argtracer::trace_code()
        #bar()
        #3 + 2
    })
}

..my_profile..(foo, bar)