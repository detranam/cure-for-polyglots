# cure-for-polyglots

The goal of this project is to benchmark all the shiny, new languages that I've been interested in or have piqued my interest. I'd like to create a standard set of benchmarks to run against a subset of languages to benchmark compiled executable size, compilation speed (cached and uncached), runtime speed, and memory usage at runtime.  

The main reason I'd like to undertake this is to separate the 'wheat from the chaff'- if a language is too cumbersome or bloated, or simply not very performant, I personally wouldn't like to invest a lot of time into learning more about it. I welcome any feedback on the tests I've written, any languages to also benchmark, and any code optimizations I may have missed.

I will also note that I regularly develop in C and C++, and have dabbled in Python in the past, so I will be taking a fresh look into these languages, learn them a bit, and run the tests on them.

# Languages

* Rust
* C++
* Zig
* Go
* Lua
* Others TBD

# Compile modes

* Static
* Dynamic
* Any simple, modern options to optimize code, eg Zig's [ReleaseFast](https://ziglang.org/documentation/master/#ReleaseFast) or Lua's [LuaJIT](http://luajit.org/)

# Metrics

* Compiled executable size
* Compilation time (cached and uncached)
* Runtime Speed
* Memory usages at runtime (peak, average, etc)

# Tests

* ~~Standard recursive function calls (10^(0,1,2,3,4,5,6) calls with arbitrary functionality inside)~~ Found out that [someone else](https://github.com/drujensen/fib/tree/main) did a far more comprehensive test on this than I did, I'll rely on their data.
* Multithreading functionality (execution time, memory usage)
* Parsing of large text file
* Concatenation of large strings
* Some sort of built-in memory torture test (stack/queue push and pop, etc)
* Large dependency structure (for compile time)

# Potential Benchmarking Tools

* [cmdbench](https://pypi.org/project/cmdbench/)
* [hyperfine](https://github.com/sharkdp/hyperfine)
