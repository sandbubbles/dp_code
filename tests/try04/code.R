# Have something like that for when I am figuring out the signal interval, basically only R

foo <- function ( n ) {
    return (1 + n) * 3 * 4 
}
..my_profile.. <- function () {
    print("f")
    3 + 2
    { 
        6 * 3
        i <- 1 
        while (i < 100000) {
            b <- foo(i) * 3
            i <- i + 1
            print(i)
        }
        print(b)
    } 
}
{ 1 + 2 ; ..my_profile..() ;print("hi") }