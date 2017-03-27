names='kaushik amaravadi reddy singh quit'
echo 'select character: '

select name in $names
do
if [ $name == 'quit' ]
then break
fi
echo hello $name
done

echo bye

