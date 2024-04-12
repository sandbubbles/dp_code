foo <- function() {
    3 + 5
}

bar <- function () {
    print("hi")
}


..my_profile.. <- function (...) {
    foo()
    argtracer::trace_code()
    bar()
    3 - 5
}
..my_profile..(foo, bar)

#..my_profile.. <- function (...) {
#    3 + 2
#}
#..my_profile..()