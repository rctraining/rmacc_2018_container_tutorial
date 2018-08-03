#!/bin/bash
#
#Check for correct arguments
if [ $# -ne 1 ]; then
     echo "illegal number of arguments"
     echo "usage: $0 <your-github-username>"
     exit 1
fi

#remove existing .git/config file to avoid upload issues
/bin/rm -Rf .git/config
#set the github username from the command line arguement to the script
github_username=${1}
git_directory=` basename "$PWD"`
#Create a remote repository on your personal github site
curl -u ${github_username} https://api.github.com/user/repos -d '{"name":"'${git_directory}'"}'
#Now create a README file for the local repository describing the contents
#echo "container tutorial" >README.md   
#Initialize the present directory as the local repository   
git init
#Add all of the files in this local repository to the commit path
git add .
#Add a comment describing this particular commit
git commit -m "first commit"
#Now tell github which remote repository you want to associate with this local repo
#(note: we are using the remote repository you created at the top of this script)
git remote add origin https://${github_username}@github.com/${github_username}/${git_directory}.git
#Now add this local repository to the remote repository
git push -u origin master
