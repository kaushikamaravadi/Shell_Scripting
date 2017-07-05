#### Use find to display the names of all files in the /home subdirectory tree. Can you do this without displaying errors for files you can't read?

```sh
find /home/ubuntu 2> /dev/null
```

#### Use find to display the names of all files in the system that are bigger than 1MB

```sh
find / -size +1M
```

#### Use find and file to display all files in the /home subdirectory tree, as well as a guess at what sort of a file they are. Do this in two different ways.

```sh
find /home/ubuntu -type f -print0 | xargs -0 file
```
```sh
find /home/ubuntu -type f -exec file {} \;
```

#### Use grep to isolate the line in /etc/passwd that contains your login details

```sh
grep `whoami` /etc/passwd
```

#### Use find and grep and sort to display a sorted list of all files in the /home subdirectory tree that contain the word hello somewhere inside them. 

```sh
sudo find /home/ubuntu -type f -print0 | xargs -0 grep -li "hello" | sort
```
* i - ignore case
* l - files with match
#### Use locate to find all filenames that contain the word emacs. Can you combine this with grep to avoid displaying all filenames containing the word lib?

```sh
locate "emacs" |grep -v "lib"
``` 


#### On Linux systems, the file /dev/urandom is a constantly generated random stream of characters. Can you use this file with od to printout a random decimal number?
```sh
od -d /dev/urandom
```

#### Type mount (with no parameters) and try to interpret the output. 

```sh
mount
```

#### Archive the contents of your home directory using tar. Compress the tar file with gzip. Now uncompress and unarchive the . tar . gz file using cat, tar and gzip on one command line.

```sh
tar -czvf mouna.tar.gz /home/ubuntu
```
```sh
tar -xzvf mouna.tar.gz -C /home/ubuntu
```
#### Use find to compile a list of all directories in the system, redirecting the output so that the list of directories ends up in a file called directories. txt and the list of error messages ends up in a file called errors. txt

```sh
find / 2 > /home/ubuntu/errors.txt
```
```sh
find / 1 > /home/ubuntu/directories.txt
```
* 0 gives standard input
* 1 gives standard output
* 2 gives standard errors

#### Run sleep 15 in the foreground, suspend it and then put it into the background. Confirm it is running in background. Bring the job back into the foreground 

```sh
sleep 15s
```
```sh
ctrl-z
```
```sh
bg
```
```sh
jobs
```
```sh
fg
```

#### Run sleep 15 in the background, and then use kill to terminate the process by its job number. Repeat, except this time kill the process by specifying its PID

```sh
sleep 15 &
kill %3
```
```sh
sleep 15 &
kill 5739
```

#### Run sleep 15 in the background, and then use kill to suspend the process. 14.show all processes that are executing. 

```sh
sleep 15 &
```
```sh
kill -TSTP 5739
```

* TSTP -- stop a process with polite stop signal.

#### show all processes that are executing

```sh
ps -aux | less
```

#### Display the process hierarchy. Look for the init process. See if you can identify important system deamons. Can you also identify your shell and its sub processes?

```sh 
ps -aeH | less
```

#### show all processes that you are executing 

```sh
ps aux | grep ubuntu | less
```

#### Start a sleep 300 process running in the background. Log off the server, and log back in again. List all the processes that you are running. What happened to your sleep process? Now repeat, except this time make sure the process is running after logout.
 
* When we execute the command sleep 300 and relogin to the machine, process sleep was already terminated.
* When we execute the command nohup sleep 300 and relog-in to machine, process sleep will still be running.

#### Try combining the commands cat inexistent and echo hello using each of these operators.

```sh
cat kaushik.txt && echo hello
```

#### What does xargs command do? Can you combine it with find and grep to find yet another way of searching all files in the /home subdirectory tree for the word hello.

```sh
find /home/ubuntu | xargs grep hello
```

#### Produce a list of login names and CPU times corresponding to each active process? Can you now use sort and head or tail to find the users whose process is using the modt CPU?

```sh
ps aux --sort=-pcpu | head
```
* -pcpu -- specify column with cpu consumption

#### Use telnet to request a web page from the web server www.google.com by connecting to port 80.

```sh
telnet www.google.com 80
```

#### Find the round-trip delay to www.yahoo.com

```sh
ping yahoo.com
```

#### See the network route taken to www.yahoo.com. Can you tell which cities your network traffic passes through?

```sh
traceroute www.yahoo.com
```

#### Get a copy of the web page http://www.cloudera.com/index.html. Have a look at the contents of the file. Can you use sed to strip out the HTML tags?

```sh
curl "http://www.cloudera.com" 
sed 's/<[^>]*>//g'
```

#### List all your processes, using sed to substitute "me" for your username.

```sh
ps -ux | sed "s/\$$USER/me/"
```
 
#### Use who,awk,sort and uniq to print out a sorted list of the logins of active users.

```sh 
usrs=`users | sort`
for i in `echo $usrs`
do
grep $i /etc/passwd | awk -F \: '{print $1}' | uniq
done
```

#### Use awk on /etc/passwd to produce a list of users and their login shells.

```sh
awk -F : '{print $1, $5}' /etc/passwd
```

#### Write an `awk` script that prints out all lines in a file expect for the first two.  

```sh 
awk 'NR>2' /home/ubuntu/mouna.py
```

#### Write a script so that it generates a random secret number between 1 and 100 and then keep asking the user to guess the secret number until they guess correctly. The script should give the user hints such as "I'm sorry your guess is too low" or "I'm sorry your guess is too high"

```sh
guess=-1
typeset -i num=0

(( answer = RANDOM % 100 + 1 ))

while (( guess != answer )); do
num=num+1
read -p "Enter guess $num: " guess
if (( guess < answer )); then
	echo "I'm sorry your guess is too high"
elif (( guess > answer )); then
	echo "I'm sorry your guess is too low"
fi
done
echo -e "Correct! That took $num guesses.\n"
```

#### Write a shell script which renmaes all .txt files as .text files

```sh
for file in *.txt; do
   mv "$file" "`basename "$file" .txt`.text"
   done
```

#### Write a shell script called pidof which takes a name as paramter and returns the PID of processes with that name.
* Now add a usage() function to your pidof script which prints usage instructions
* Call usage() if the wrong number of parameters is passed to the script.
* All errors should call a function which should print the datetime in YYYMMDDHHMMSS format with the error message.

```sh

#### Modify your .bash_profile script so that your PATH includes the current directory and so that your editor is set to 'vi'
 
```sh
PATH=$PATH:.
export EDITOR='vi'
export VISUAL='vi'
source ~/.bash_profile
```

