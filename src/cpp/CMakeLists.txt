cmake_minimum_required(VERSION 3.5)
project(CppBenchmarking VERSION 1.0 LANGUAGES CXX)

# Speed options: -Ofast
# Compile size options: -Os (this often creates a larger executable than -O2!)
# General improvement: -O3
# add_compile_options(-Ofast)

if(DEFINED basic_printf)
    # Print 'Hello!'
    add_executable(basic_printf basic_printf.cpp)
endif()

if(DEFINED print_testwords)
    # Print all words in testwords
    add_executable(print_testwords print_testwords.cpp)
endif()

if(DEFINED multithread_counter)
    # Count to n million with n threads using mutexes
    add_executable(multithread_counter multithread_counter.cpp)
endif()

if(DEFINED multithread_counter_atomic)
    # Count to n million with n threads with an atomic int (not a standard test)
    add_executable(multithread_counter_atomic multithread_counter_atomic.cpp)
endif()

if(DEFINED dynamic_array_with_builtin)
    # Push back n builtin items
    add_executable(dynamic_array_with_builtin dynamic_array_with_builtin.cpp)
endif()

if(DEFINED dynamic_array_with_allocated)
    # Push back n allocated items
    add_executable(dynamic_array_with_allocated dynamic_array_with_allocated.cpp)
endif()
