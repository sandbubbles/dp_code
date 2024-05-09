## Start the profiler with memory profiling enabled
#Rprof("my_profile.out")
#facto <- function (n) {
#    if (n == 0) {
#        return(1)
#    } else {
#        return(n * facto(n - 1))
#    }
#}
#lapply(1:1000000, function(i) {
#        facto(30)
#})
## Stop the profiler
#Rprof(NULL)
## Analyze the profile
#summary <- summaryRprof("my_profile.out")
#print(summary)

# Start the profiler with memory profiling enabled
Rprof("my_profile.out")
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
    lapply(1:100, function(i) {
        foo(1)
        argtracer::trace_code(1000)


        foo(0.1)
        argtracer::trace_code(100)


        foo(0.01)
        argtracer::trace_code(10)

        
        foo(0.001)
        argtracer::trace_code(1)

    })
}

..my_profile..()


# Stop the profiler
Rprof(NULL)

# Analyze the profile
summary <- summaryRprof("my_profile.out")
print(summary)