foo <- function() {
    for (i in 1:20000) {
         result <- sum(rnorm(1:i))
    }
}

bar <- function () {
    lapply(1:20000, function(i) {
         result <- sum(rnorm(1:i))
    })
}


Rprof("my_profile_5.out", interval = 0.01)
    lapply(1:5, function(i) {
        foo()
        bar()
    })
Rprof(NULL)
