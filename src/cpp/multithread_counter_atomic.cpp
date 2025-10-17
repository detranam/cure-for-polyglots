#include <iostream>
#include <mutex>
#include <thread>
#include <vector>
#include <atomic>
 
static std::atomic<int> globalCounter {0};
static constexpr int countTo {10'000'000};
 
void incrementCounter()
{
    while (true) {
        if (globalCounter == countTo) {
            return;
        }
        globalCounter++;
    }
}
 
int main(int argc, char *argv[]){
    // Intend to be called like ./multithread_counter_atomic 5
    int threadCount = std::atoi(argv[argc-1]);
    std::cout << "Counting to " << countTo << " with " << threadCount << " threads using an atomic int.";

    std::vector<std::thread> threads;
    for (int i = 0; i < threadCount; i++)
    {
        threads.push_back(std::thread(incrementCounter));
    }

    for (int i = 0; i < threadCount; i++)
    {
        threads[i].join();
    }

    std::cout << "Counter value: " << globalCounter << std::endl;
}