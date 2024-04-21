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
    lapply(1:1000, function(i) {
        lapply(1:50, function(i) {  
            facto(i)
            facti(i)
        })
    })
}

..my_profile..()