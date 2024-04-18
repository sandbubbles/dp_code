fibonnaci <- function(n) {
    if (n <= 1) {
        return(n)
    } else {
        return(fibonnaci(n - 1) + fibonnaci(n - 2))
    }
}

..my_profile.. <- function (...) {
    print(fibonnaci(30))
}

..my_profile..(fibonnaci)