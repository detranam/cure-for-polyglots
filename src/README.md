# Coding Language Source Code

In the attempt to make this as easy as possible to implement more languages while still allowing parsing of statistics, I'm defining an interface for each src 'module', and from that, we will allow easy benchmarking, collecting, and analyzing of data.

## Module Requirements

Each module needs the ability to run tests with specific parameters, collect that data, and present it in a uniform way to any analysis scripts. To do this, I have a few requirements from each module.

### benchmark_this.sh

benchmark_this.sh is a shell script that knows how to compile each source file into an executable, run them, and collect where that data goes.

### results.json

Each benchmark should include the following data, collected in a json file-
* Uncached build time high, low, average
* Cached build time high, low, average
* Execution time high, low, average
* Memory usage (bytes) high, low, average
* More TBD
