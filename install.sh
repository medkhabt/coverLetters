#! /bin/bash

# Maybe the installer in the release 
## Don't forgot the version.

mkdir ~/Library/Job-apply

version='1.0'
## Set the job_apply path ( static first than maybe also make it dynamic)
project_path="$HOME/Library/Job-apply/$version"

mkdir $project_path

## put the path in library ? 
cd $project_path;
git clone https://github.com/medkhabt/coverletters.git . 

rm TODO.md 2> /dev/null
rm README.md 2> /dev/null
rm install.sh 2> /dev/null

## mv command to the /bin
mv job-apply-core /usr/local/bin/job-apply-core-$version
mv job-apply /usr/local/etc/bash_completion.d/

mkdir applications


## Check first if they don't exist in the bashrc file.

echo "export job_apply_path='$project_path'" >> ~/.bashrc
echo "alias job-apply='. job-apply-core-$version'" >> ~/.bashrc


## mv the completion command 
