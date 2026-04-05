now=$(date +"%d-%m-%Y-%T")
imageDirectory="image_$now"

mkdir tests/$imageDirectory

for pyver in $(cat versions.txt); do 
    outputFile="output_$pyver.txt"
    docker buildx build --build-arg python_version="$pyver" --tag mytest:$pyver . | tee tests/$imageDirectory/$outputFile
done