foo <- function(interval ) {
    start_time <- Sys.time()
    elapsed_time <- 0
    while (elapsed_time < interval) {
    result <- sum(1:100000000)
    end_time <- Sys.time()
    elapsed_time <- end_time - start_time
    }

}


..my_profile.. <- function (...) {
    lapply(1:5, function(i) {
        foo(1)
        argtracer::trace_code(1000)

        foo(0.5)
        argtracer::trace_code(500)

        foo(0.1)
        argtracer::trace_code(100)

        foo(0.05)
        argtracer::trace_code(50)

        foo(0.01)
        argtracer::trace_code(10)

        foo(0.005)
        argtracer::trace_code(5)
        
        foo(0.001)
        argtracer::trace_code(1)

    })
}

..my_profile..()