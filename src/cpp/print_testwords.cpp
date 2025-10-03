#include <iostream>
#include <string>
#include <fstream>

int main() {
    std::ifstream filein("testwords.txt");

    for (std::string line; std::getline(filein, line); ) 
    {
        std::cout << line << std::endl;
    }
    return 0;
}