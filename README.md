# sync-files-git-commits-shellscript
- Shell script to sync - copy or delete - files from git commits, from source directory to destination directory, including recursively creating any new directories with same permissions as the source.

- Just change:
  
  destination directory path in copyfiles.sh.
  
  NOTES: 
  
  1) Place this shell script at the ROOT DIRECTORY of your project or source directory, so it can run git commands, and can take files from paths relative to your project root directory.

  2) just run the shell script like any other : `./copyfiles.sh` from the directory it is placed in.
  
  3) DO NOT FORGET to `chmod 0777 copyfiles.sh` or you might see error `./copyfiles.sh: command not found`.
