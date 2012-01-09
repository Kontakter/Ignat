path=`pwd`
for x in `ls -a . | egrep -v "\.$" | egrep -v "init.sh" | egrep -v "Makefile" | egrep -v ".git/"`
do
    if [ -f ~/$x ]; then
        echo "File $x already exists"
    else
        echo "Creating symbolic link to $x"
        ln -s $path/$x ~/$x
    fi
done
