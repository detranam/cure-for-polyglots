lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for dir in "${directories[@]}"
do
    echo Building all tests in $dir
    cd $dir
    ./build_this.sh
    cd ..
done