now=$(date +"%d-%m-%Y-%T")
testDirectory="test_$now"

mkdir tests/$testDirectory

for pyver in $(cat versions.txt); do 
    outputFile="output_$pyver.txt"
    docker run --rm -v $(pwd):/workspace mytest:$pyver | tee tests/$testDirectory/$outputFile
done