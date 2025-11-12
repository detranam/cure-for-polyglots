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
* [memusage](https://manpages.ubuntu.com/manpages/xenial/man1/memusage.1.html)
* [heaptrack](https://manpages.ubuntu.com/manpages/xenial/man1/memusage.1.html)

## Benchmarking Tools in Practice

Looking into the actual use case of each tool, I've settled on two of them for now.

### hyperfine

hyperfine will be used to benchmark build times. It allows a 'prepare' parameter that allows for testing 'cold cache' behavior.  
Example: hyperfine --export-json 'testwords_build.json' --prepare 'rm -rf target'  'cargo build'

### cmdbench

cmdbench will be used for runtime memory analysis. It can create nice PNGs, but also allows for JSON output of the memory statistics. I plan on simply capturing the nicely-formatted output of the statistics using '-s'.  
Example: cmdbench -i 10 -s cargo run