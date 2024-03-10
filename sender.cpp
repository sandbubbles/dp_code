#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>  
#include <chrono>
#include <iostream>
#include <fstream>

uint64_t timeSinceEpochMillisec() {
  using namespace std::chrono;
  return duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();
}

int main (int argc, char * argv []) {
    if (argc != 2) {
        std::cout << "Usage: " << argv[0] << " <pid>" << std::endl;
        return 1;
    }
    int pid = atoi(argv[1]);

    if (kill(pid, 0)) {
        std::cout << "You cant send signal to this process" << std::endl;
        return 1;
    }
    std::ofstream outputFile("sender.txt");

    if (outputFile.is_open()) {
        while (!kill(pid, SIGTSTP)) {
            outputFile << "Sent at: " << timeSinceEpochMillisec() << std::endl;
            sleep(2);
        }
    }

    outputFile.close();
    return 0;
}