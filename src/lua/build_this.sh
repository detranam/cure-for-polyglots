lsDirectories="$(ls *.lua)"
directories=($lsDirectories)

mkdir build

for luafile in "${directories[@]}"
do
    echo "Running luac on $luafile"
    luacoutput=${luafile%.lua*}
    luac -o build/$luacoutput $luafile
done