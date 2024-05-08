

# Maybe the installer in the release 
## Don't forgot the version.

mkdir ~/Library/job-apply

version=1.0
## Set the job_apply path ( static first than maybe also make it dynamic)
project_path="~/Library/job-apply/$version"

mkdir $project_path

## put the path in library ? 

git clone https://github.com/medkhabt/coverletters.git $project_path

rm $project_path/TODO.md 2> /dev/null
rm $project_path/README.md 2> /dev/null
rm $project_path/install.sh 2> /dev/null

## mv command to the /bin
mv $project_path/job-apply-core /usr/bin 
mv $project_path/job-apply /usr/local/etc/bash_completion.d/


echo "export job_apply_path=$project_path" >> ~/.bashrc
echo "alias job-apply='. job-apply-core'" >> ~/.bashrc


## mv the completion command 
