#! /etc/bash


cleanup() {
    echo "Cleaning up..."
    # Kill the process of the opend file with preview 
    # I specified .. as the run script is in x/src/ dir while the pdf is in x/target/ so i had to check all the open files from x dir hence '..'
    kill $(lsof +D ..| grep "$file_name" | grep "pdf" | awk '{print $2}' | head -n1)
    echo "Cleanup complete."
	exit 1 
}


#if [ -z "${1}" ]; then echo ">> No file specified."; echo ">> Terminate the srcipt" ; exit 2 ; fi;
trap cleanup SIGINT

#file_name=$(echo "$1" | cut -d "." -f1 | rev | cut -d "/" -f1 | rev)
#mv $file_name.pdf old_$file_name.pdf
# generate the tex file
echo ">> genrating the tex file"
xsltproc --output ../build/cover_letter.tex to_latex.xslt configs.xml
echo ">> Start compiling the tex file";
pdflatex -halt-on-error ../build/cover_letter.tex > /dev/null
mv cover_letter* ../build/
# not workign yet
#mv $file_name* ../build
mv ../build/cover_letter.pdf ../target

echo ">> Opening the generated pdf file"
open -F  -a Preview "../target/cover_letter.pdf" 

echo "Press Ctrl+C to exit."
while true; do
    sleep 1
done

echo "script ended."
