# RScalene

This is a proof-of-concept profiler for R based on [Scalene](https://github.com/plasma-umass/scalene).

The implementation is written into GNU R 4.3.3.
To use it it we need to build it from source code:
```
./configuration
make
```
Our profiler does not support profiling bytecode. Therefore, we need to disable JIT.
That can be done either through environment variable `R_ENABLE_JIT=0 ` or in code by `compiler::enableJIT(0)`.

To enable our profiler we must use the `R_SCALENE` environment variable and set it to a filename where the profiling output is stored.

The profiled code must be wrapped in the `..my_profile...` function.
To start profiling we run the function.
If we pass names of functions to `..my_profile...` call, then we profile the lines of those functions as well.
For an example of usage look at the following code.
```
facto <- function (n) {
    if (n == 0) {
        return(1)
    } else {
        return(n * facto(n - 1))
    }
    
}
facti <- function (n) {
    result <- 1
    for (i in 1:n) {
        result <- i * result
    }
    return (result)
}

..my_profile.. <- function (...) {
    lapply(1:10000, function(i) {
        lapply(1:50, function(i) {  
            facto(i)
            facti(i)
        })
    })
}

..my_profile..()
```