lsDirectories="$(ls -d */)"
directories=($lsDirectories)
cp ../../test-materials/testwords.txt ./testwords.txt

for file in *.cpp; do    
    executableName=${file::-4}
    echo Benchmarking C++ program $executableName
    # Benchmark the building without caching
    hyperfine --export-json results/${executableName}_build_without_caching.json --prepare 'rm -rf build'  "cmake -D${executableName}=1 -Bbuild -S. && cmake --build build"
    # We now can assume the build exists, test building with caching (effectively doing nothing)
    hyperfine --export-json results/${executableName}_build_with_caching.json "cmake -D${executableName}=1 -Bbuild -S. && cmake --build build"
    # Benchmark the running
    cmdbench -i 10 -s build/${executableName} > results/${executableName}_runtime.txt
done
