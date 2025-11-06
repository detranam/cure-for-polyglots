lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for dir in "${directories[@]}"
do
    echo Building go program in $dir
    cd $dir
    go fmt
    go build "$(ls *.go)"
    cd ..
done

cp ../../test-materials/testwords.txt print_testwords/