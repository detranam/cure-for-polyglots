lsDirectories="$(ls *.lua)"
directories=($lsDirectories)

mkdir build
cp ../../test-materials/testwords.txt ./

for luafile in "${directories[@]}"
do
    echo "Running luac on $luafile"
    luacoutput=${luafile%.lua*}
    luac -o build/$luacoutput $luafile
done