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
    # Benchmark the building without caching
    hyperfine --export-json ${dir::-1}_build_without_caching.json --prepare 'go clean -cache'  'go build'
    # Benchmark the building with caching
    hyperfine --export-json ${dir::-1}_build_with_caching.json 'go build'
    # Benchmark the running.
    echo "cmdbench -i 10 -s ./${dir::-1} > ${dir::-1}_runtime.txt"
    cmdbench -i 10 -s ${dir::-1} > ${dir::-1}_runtime.txt
    cd ..
done

find ./ -name '*.json' -exec cp -prv '{}' 'results' ';'
find ./ -name '*.txt' -exec cp -prv '{}' 'results' ';'
