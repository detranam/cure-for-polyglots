lsDirectories="$(ls -d */)"
directories=($lsDirectories)
cp ../../test-materials/testwords.txt print_testwords/
rm -rf results
mkdir results

for dir in "${directories[@]}"
do
    echo Benchmarking Go program in $dir
    # Preparatory / formatting things
    cd $dir
    go fmt
    go clean -cache
    rm runtime.txt
    # Benchmark the building without caching
    #hyperfine --export-json ${dir::-1}_build_without_caching.json --prepare 'go clean -cache'  'go build'
    # Benchmark the building with caching
    hyperfine --export-json ${dir::-1}_build_with_caching.json 'go build'
    # Benchmark the running.
    for i in {0..10}
    do
        echo Run $i >> runtime.txt
        time_taken="$( { time ./"${dir::-1}" 1>/dev/null; } 2>&1 | tail -n 3 )"
        echo "$time_taken" >> runtime.txt
    done
    #hyperfine --export-json ${dir::-1}_run.json ./${dir::-1}
    #cmdbench -i 10 -s ${dir::-1} > ${dir::-1}_runtime.txt
    exit 1
    cd ..
done

# Harvest all data and place into results/
find ./ -name '*.json' -exec mv '{}' 'results' ';'
find ./ -name '*.txt' -exec mv '{}' 'results' ';'
