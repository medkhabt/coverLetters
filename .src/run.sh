#! /etc/bash


cleanup() {
  echo "Cleaning up..."
  # Kill the process of the opend file with preview 
  kill $(lsof +D .| grep "$file_name" | grep "pdf" | awk '{print $2}' | head -n1)
    echo "Cleanup complete."
    exit 1  # or any other exit code you prefer
}
if [ -z "${1}" ]; then echo ">> No file specified."; echo ">> Terminate the srcipt" ; exit 2 ; fi;
trap cleanup SIGINT

file_name=$(echo "$1" | cut -d "." -f1 | rev | cut -d "/" -f1 | rev)
mv $file_name.pdf old_$file_name.pdf
echo ">> Start compiling the $1";
pdflatex -halt-on-error $1 > /dev/null
# not workign yet
mv $file_name* ../build
mv ../build/$file_name.pdf ../target
mv ../build/$file_name.tex ../src
echo ">> $1 compiled";

echo ">> Opening the generated pdf file"
open -F  -a Preview "../target/$file_name.pdf" 

echo "Press Ctrl+C to exit."
while true; do
    sleep 1
done

echo "script ended."
