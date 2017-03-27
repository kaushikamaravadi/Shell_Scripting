c=0
a=1
b=1
read -p "Enter the limit of fibonacci series" n
echo -n "$a"
echo -n "$b"
while((c<n))
do
c=$((a+b))
echo -n "$c"
a=$b
b=$c
done
echo

