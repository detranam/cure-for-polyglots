lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for dir in "${directories[@]}"
do
    cd $dir
    cargo fmt
    cargo build
    cd ..
done

cp ../../test-materials/testwords.txt print_testwords/