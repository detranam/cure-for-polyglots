#include <vector>
#include <iostream>

int main(int argc, char *argv[]){
    // Intend to be called like ./dynamic_array_with_builtin 5
    int pushedItems = std::atoi(argv[argc-1]);
    std::cout << "Testing a push/pop with " << pushedItems << " builtin items.\n";

    std::vector<int> myvec {};
    for (int i = 0; i < pushedItems; i++)
    {
        myvec.push_back(i);
    }
    for (auto i : myvec)
    {
        myvec.pop_back();
    }
}