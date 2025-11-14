lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for dir in "${directories[@]}"
do
    echo Benchmarking Rust program in $dir
    # Preparatory / formatting things
    cd $dir
    cargo fmt
    rm -rf target
    # Benchmark the building without caching
    hyperfine --export-json ${dir::-1}_build.json --prepare 'rm -rf target'  'cargo build'
    # Benchmark the running.
    # TODO: I shouldn't be using cargo run, it's ~50% slower than just running the executable
    cmdbench -i 10 -s cargo run > ${dir::-1}_runtime.txt
    cd ..
done

cp ../../test-materials/testwords.txt print_testwords/