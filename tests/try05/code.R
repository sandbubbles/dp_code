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


..my_profile.. <- function (...) {
    lapply(1:5, function(i) {
        foo()
        bar()
    })
}

..my_profile..()