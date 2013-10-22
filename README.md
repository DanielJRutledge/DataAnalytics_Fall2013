DataAnalytics_Fall2013
======================

Repo for fall semester project.


Feel free to play with it! If you are unsure about using the terminal to interact with github, download and install their gui.
It will make "committing" and "pushing" a bit friendlier. For the real power though, it's best to learn how to use terminal.

Here's some handy internet stuff:

https://help.github.com/articles/using-pull-requests

http://stackoverflow.com/questions/11019839/how-to-use-github-using-terminal-commands


If you want to have a separate version of this project that won't affect the master branch when you commit, make your own 
branch to commit to and then commit to master when you want. We should be able to view the different branches and compare it
to master as you develop within the branch. 


<b>Quick & Dirty gitHub Tutorial </b>


If you have your own branch that you're developing in and you want to make sure you are developing in that branch:

`git checkout yourBranch` 

Where yourBranch is the name of your branch. This assumes you are in "DataAnalytics_Fall2013" directory on terminal or command prompt on your computer
This is how you switch between branches in general, "master" is the name of the root branch

Once you use the above command everything you do, once committed will update on your branch only


If you are ready to update your branch:

`git commit -a`  

This will send you to a text editor to write a label and details of your update, once everything goes ok

`git push origin` 

This assumes that you are "pushing" your updates to the branch you're currently in
so if you want to push to master,

`git push origin master`


If you realize that master has changed a lot and you want your branch to update:

`git checkout master`

`git pull`

`git checkout yourBranch`

`git merge master`


If you now want to update master with everything in your branch:

`git checkout master`

`git merge yourBranch`

`git push origin master`

If you're not using a branch just make sure you are using 'git pull' to update your version on your computer
when you are ready to commit to master then it's just 

`git commit -a `
Remember this command will send you to a default text editor, you can change what this editor is but it depends on your system.
To update master,

`git push origin`

 




Project Notes:
=============

• 
