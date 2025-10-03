cmake_minimum_required(VERSION 3.5)
project(CppBenchmarking VERSION 1.0 LANGUAGES CXX)

# Speed options: -Ofast
# Compile size options: -Os (this often creates a larger executable than -O2!)
# General improvement: -O3
# add_compile_options(-Ofast)

# Print 'Hello!'
add_executable(basic_printf basic_printf.cpp)

# Print all words in testwords
add_executable(print_testwords print_testwords.cpp)

# Count to n million with n threads using mutexes
add_executable(multithread_counter multithread_counter.cpp)

# Count to n million with n threads with an atomic int (not a standard test)
add_executable(multithread_counter_atomic multithread_counter_atomic.cpp)

# Push back n builting items
add_executable(dynamic_array_with_builtin dynamic_array_with_builtin.cpp)

# Push back n builting items
add_executable(dynamic_array_with_allocated dynamic_array_with_allocated.cpp)