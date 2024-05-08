#! /bin/bash


clean(){
    rm -rf $HOME/Library/Job-apply
    cp $HOME/.bashrc $HOME/.back_up_bashrc
    grep -v '\#job-apply-snippet' $HOME/.bashrc > $HOME/.tmp_bashrc
    mv $HOME/.tmp_bashrc $HOME/.bashrc
    rm /usr/local/bin/job-apply*
}


echo "cleaning.."
clean

echo "end of cleaning"

mkdir ~/Library/Job-apply

version='alpha-0.1.0'

project_path="$HOME/Library/Job-apply/$version"
mkdir $project_path

cd $project_path;
git clone https://github.com/medkhabt/coverletters.git . 

rm TODO.md 2> /dev/null
rm README.md 2> /dev/null
rm install.sh 2> /dev/null

mv job-apply-core /usr/local/bin/job-apply-core-$version
mv job-apply /usr/local/etc/bash_completion.d/

mkdir applications


## Check first if they don't exist in the bashrc file.

echo "# Don't remove the the comments #job-apply-snippet , important for the cleaning/check existance of the .bashrc file of job-apply-snippets" >> $HOME/.bashrc
echo ". /usr/local/etc/bash_completion.d/job-apply #job-apply-snippet" >> $HOME/.bashrc 
echo "export job_apply_path='$project_path' #job-apply-snippet" >> $HOME/.bashrc
echo "alias job-apply='. job-apply-core-$version' #job-apply-snippet" >> $HOME/.bashrc

## mv the completion command 


