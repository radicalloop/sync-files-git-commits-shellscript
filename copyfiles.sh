SRC_DIR="/source/directory/path/"
DEST_DIR="/destination/directory/path/"
for file in $(<filelist.txt); 
do
	SCRIPTPATH=$(dirname "$file")
	DIRPERM=`stat -c "%a" $SRC_DIR$SCRIPTPATH`	
	mkdir -p --mode=$DIRPERM $DEST_DIR$SCRIPTPATH && cp $SRC_DIR$file $DEST_DIR$file
done
