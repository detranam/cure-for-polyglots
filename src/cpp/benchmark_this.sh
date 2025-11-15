lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for file in *.cpp; do
    executableName=${file::-4}
    echo Benchmarking C++ program $executableName
    # Preparatory things
    cmake -Bbuild -S.
    cp ../../test-materials/testwords.txt build/
    rm -rf build
    # Benchmark the building without caching
    hyperfine --export-json ${executableName}_build.json --prepare 'rm -rf build'  "cmake -D${executableName}=1 -Bbuild -S. && cmake --build build"
    # Benchmark the running.
    cmdbench -i 10 -s ${executableName} > ${executableName}_runtime.txt
done

cp ../../test-materials/testwords.txt print_testwords/