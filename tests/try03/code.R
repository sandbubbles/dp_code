#i <- 0
#while (1 < 2) {
#    print(i)
#    i <- i + 1
#}
#Total number of lines: 3000
#Average: 10
#Mode: 10
#Median: 10
#Number of values above 20: 5

# I also tried :
compiler::enableJIT(0)
 while (1 < 2) {
     4 + 3
 }
# we need to disable jit otherwise the while loop will be optimized away