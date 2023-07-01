When you have problems pushing or pulling your repo on your computer to/from your repo up on github.

  1. Make a new folder on your computer that is not within your repo folder ("backup")
  2. Copy all of your repo folder, its files and subfolders to the new folder that you just made 
  3. Now you have a safe backup of all your current working files.
  4. Now delete the folder/subfolders and all files, in your repo so that it is gone.
  5. Now go and clone your repo from Github, so you have a fresh local copy.
  6. Now you should be able to git pull and git push without problem to your computer.
  7. After successfully git pulling, move any single files that were in your old repo from your backup folder, 
      one at a time to your new repository.
  8. Then git commit and git push, and they will go up to Github.
  
If you are having a problem pushing *large files*:
  1. Follow these steps using the Terminal pane (after moving the giant file out of your local repo and backing it up somewhere else):
    a. Remove that file from the cache: `git rm --cached giant_file`
    b. Commit this change using `git commit --amend -CHEAD`
    c. Push the corrected commit using `git push`
 
 If, for any reason, you just can't push changes and need to use the *NUCLEAR OPTION*:
  1. Make a new clone of repo (go to your repo github.com and copy the code from the green button). Then in R Studio make a new project, Version Control, Git, and place name the folder something like New_Personal_Repo. 
  2. Go to the finder or file browser and copy the files that are missing from your old repo to your new repo. But not the giant file!
  3. Commit and push the new changes.
