SRC_DIR="public"
DEST_DIR="public1"
for file in $(<filelist.txt); 
do
	SCRIPTPATH=$(dirname "$file")
	DIRPERM=`stat -c "%a" $SRC_DIR$SCRIPTPATH`	
	mkdir -p --mode=$DIRPERM $DEST_DIR$SCRIPTPATH && cp $SRC_DIR$file $DEST_DIR$file
done