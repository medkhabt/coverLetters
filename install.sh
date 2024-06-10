#! /bin/bash

machine="$(uname -s)"
case "${machine}" in 
	Linux*) app_dir="/usr/lib/Job-apply"; completion_dir="/usr/share/bash-completion/completions";;
        Darwin*) app_dir="$HOME/Library/Job-apply"; completion_dir="/usr/local/etc/bash_completion.d/";;
	*) echo "Machine not compatible with the script"; exit 1;;
esac 

clean(){
    rm -rf $app_dir 
    cp $HOME/.bashrc $HOME/.back_up_bashrc
    grep -v '\#job-apply-snippet' $HOME/.bashrc > $HOME/.tmp_bashrc
    mv $HOME/.tmp_bashrc $HOME/.bashrc
    rm /usr/local/bin/job-apply*
    rm $completion_dir/job-apply
}


echo "cleaning.."
clean

echo "end of cleaning"

mkdir $app_dir 

version='alpha-0.1.0'

project_path="$app_dir/$version"
mkdir $project_path

cd $project_path;
git clone https://github.com/medkhabt/coverletters.git . 

rm TODO.md 2> /dev/null
rm README.md 2> /dev/null
rm install.sh 2> /dev/null

mv job-apply-core /usr/local/bin/job-apply-core-$version
mv job-apply $completion_dir 

mkdir applications


## Check first if they don't exist in the bashrc file.

echo "# Don't remove the the comments #job-apply-snippet , important for the cleaning/check existance of the .bashrc file of job-apply-snippets" >> $HOME/.bashrc
echo ". /usr/local/etc/bash_completion.d/job-apply #job-apply-snippet" >> $HOME/.bashrc 
echo "export job_apply_path='$project_path' #job-apply-snippet" >> $HOME/.bashrc
echo "alias job-apply='. job-apply-core-$version' #job-apply-snippet" >> $HOME/.bashrc

## mv the completion command 


