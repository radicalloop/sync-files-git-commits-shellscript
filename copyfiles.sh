SRC_DIR="" #usually, no need to change this
DEST_DIR="" #change it

dt=$(date +%s)

echo "Files from how many commits do you want to copy?: "
read commits

> filelist-$dt.txt

if [[ $commits > 0 ]]; then

	hashlist=`git log --format="%H" -n $commits`

	echo ----------Files------------
	
	for hashnum in $hashlist;
	do
		filelist=`git log -m -1 --name-only --pretty="format:" $hashnum `
		for filename in $filelist;
		do
			echo $filename >> filelist-$dt.txt
		done		
	done
	cat filelist-$dt.txt
	echo ---------------------------
	echo 'Proceed copying above files? [y/n]'	
	read copyans
	if [[ $copyans == 'y' || $copyans == 'Y' ]]; then
		for file in $(<filelist-$dt.txt); 
		do
			SCRIPTPATH=$(dirname "$file")
			
			if [ -f "$file" ] 
			then
				{
					DIRPERM=`stat -c "%a" $SRC_DIR$SCRIPTPATH`	
					mkdir -p --mode=$DIRPERM $DEST_DIR$SCRIPTPATH && cp $SRC_DIR$file $DEST_DIR$file 
				}
			elif [[ -f "$DEST_DIR$file" ]]; 
			then
				rm -r $DEST_DIR$file 
			else
				echo $DEST_DIR$file ' - file not exists'
			fi

		done
		echo "Done copying."	
	else
		echo "Terminated."
	fi
fi
rm -f filelist-$dt.txt
