echo "Enter the file name"
read fname
echo "enter starting line number"
read s1
echo “enter ending line number”
read el
d=`expr $el - $sl`
if [ -f $fname ]
then
echo "the lines between $sl and $el of given file are"
head -$el $fname | tail -$d
else
echo "file doesnt exist"
fi

