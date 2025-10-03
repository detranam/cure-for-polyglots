#include <vector>
#include <iostream>
#include <string>

int main(int argc, char *argv[]){
    // Intend to be called like ./dynamic_array_with_builtin 5
    int pushedItems = std::atoi(argv[argc-1]);
    std::cout << "Testing a push/pop with " << pushedItems << " allocated items.\n";

    std::vector<std::string> myvec {};
    for (int i = 0; i < pushedItems; i++)
    {
        myvec.push_back(std::string{std::to_string(i)});
    }
    for (auto i : myvec)
    {
        myvec.pop_back();
    }
}