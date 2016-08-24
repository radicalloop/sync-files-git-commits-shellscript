SRC_DIR="" #usually, no need to change this
DEST_DIR="/path/to/destination/dir/" #change it - notice the trailing slash

dt=$(date +%s)

echo "Files from how many commits do you want to copy/sync?: "
read commits

> filelist-$dt.txt

if [[ $commits > 0 ]]; then

    hashlist=`git log --format="%H" -n $commits`

    echo ----------Files------------

    for hashnum in $hashlist;
    do
        filelist=`git log -m -1 --name-only --pretty="format:" $hashnum`
        for filename in $filelist;
        do
            if ! grep -Fxq "$filename" filelist-$dt.txt
            then
               echo $filename >> filelist-$dt.txt
            fi
        done
    done
    cat filelist-$dt.txt
    echo ---------------------------
    echo 'Proceed copying/syncing above files? [y/n]'
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
                echo $DEST_DIR$file ' - file does not exist.'
            fi

        done
        echo "Done syncing."
    else
        echo "Terminated."
    fi
fi
rm -f filelist-$dt.txt
