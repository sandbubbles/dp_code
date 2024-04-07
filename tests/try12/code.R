..my_profile.. <- function () {
    for (i in 1:5) {
        print("hi")
        argtracer::trace_code()
        3 + 2
    }
}
..my_profile..() 