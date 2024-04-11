foo<- function() {
    start_time <- Sys.time()

    elapsed_time <- 0
    while (elapsed_time < 1) {
    result <- sum(1:100000000)
    end_time <- Sys.time()
    elapsed_time <- end_time - start_time
    }

}


..my_profile.. <- function () {
    for (i in 1:5) {
        print("hi")
        start_time <- Sys.time()
#    elapsed_time <- 0
#    while (elapsed_time < 1) {
#    result <- sum(rnorm(1:10000000))
#    end_time <- Sys.time()
#    elapsed_time <- end_time - start_time
#    }
        foo()
        argtracer::trace_code()
        3 + 2
    }
}
..my_profile..() 