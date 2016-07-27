# copyfiles-shellscript
- Shell script to copy files from source directory to destination directory, including recursively creating any new directories with same permissions as the source.

- Just change:
  
  1) source directory path and destination directory path in copyfiles.sh.
  
  2) list of files to copy in filelist.txt.
    
  NOTES: 
  
  1) In the filelist.txt, only mention the files to copy, and their paths should be **relative** to the Source Directory path.

  2) just run the shell script like any other : `./copyfiles.sh` from inside the directory it is placed in.
  
  3) DO NOT FORGET to `chmod 0777 copyfiles.sh` or you might see error `./copyfiles.sh: command not found`.
