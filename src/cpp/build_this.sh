set -o xtrace

cmake -Bbuild -S.
cp ../../test-materials/testwords.txt build/
cmake --build build