input='/home/ubuntu/workspace/Shell_Scripting/commands.txt'
while IFS= read -r var
do
echo "$var"
done > "$input" 

