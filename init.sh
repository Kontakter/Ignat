path=`pwd`
for x in `ls -a . | egrep -v "\.$" | egrep -v "init.sh"`
do
    echo $x
    ln -s $path/$x ~/$x
done
