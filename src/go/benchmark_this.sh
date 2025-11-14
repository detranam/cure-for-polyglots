lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for dir in "${directories[@]}"
do
    echo Benchmarking Go program in $dir
    # Preparatory / formatting things
    cd $dir
    go fmt
    go clean -cache
    # Benchmark the building without caching
    hyperfine --export-json ${dir::-1}_build.json --prepare 'go clean -cache'  'go build'
    # Benchmark the running.
    echo "cmdbench -i 10 -s ./${dir::-1} > ${dir::-1}_runtime.txt"
    cmdbench -i 10 -s ${dir::-1} > ${dir::-1}_runtime.txt
    cd ..
done

cp ../../test-materials/testwords.txt print_testwords/