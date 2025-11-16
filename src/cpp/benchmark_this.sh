lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for file in *.cpp; do
    file="dynamic_array_with_allocated.cpp"
    executableName=${file::-4}
    echo Benchmarking C++ program $executableName
    # Preparatory things
    cmake -Bbuild -S.
    cp ../../test-materials/testwords.txt build/
    rm -rf build
    # Benchmark the building without caching
    hyperfine --export-json ${executableName}_build.json --prepare 'rm -rf build'  "cmake -D${executableName}=1 -Bbuild -S. && cmake --build build"
    # Benchmark the running.
    cmdbench -i 10 -s build/${executableName} > ${executableName}_runtime.txt
    exit 1
done

cp ../../test-materials/testwords.txt print_testwords/