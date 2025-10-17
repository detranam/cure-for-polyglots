lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for dir in "${directories[@]}"
do
    cd $dir
    cargo fmt
    cargo build
    cd ..
done