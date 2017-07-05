1. Use find to display the names of all files in the /home subdirectory tree. Can you do this without displaying errors for files you can't read?

```sh
find /home 2> /dev/null
```

2> file redirects stderr to file

/dev/null is the null device it takes any input you want and throws it away. It can be used to suppress any output.


2.  Use find to display the names of all files in the system that are bigger than 1MB
```sh
find / -size +1M

-size +1M gives file size which is greater than 1 mb
```

3. Use find and file to display all files in the /home subdirectory tree, as well as a guess at what sort of a file they are. Do this in two different ways.
```sh
find /home -type f -print0 | xargs -0 file
```

4.Use grep to isolate the line in /etc/passwd that contains your login details

```sh
grep `whoami` /etc/passwd

```

5. Use find and grep and sort to display a sorted list of all files in the /home subdirectory tree that contain the word hello somewhere inside them. 

```sh
sudo find /home -type f -print0 | xargs -0 grep -li "hello"|sort
```

6. Use locate to find all filenames that contain the word emacs. Can you combine this with grep to avoid displaying all filenames containing the word lib?

```sh
locate "emacs" |grep -v "lib"
``` 


7. On Linux systems, the file /dev/urandom is a constantly generated random stream of characters. Can you use this file with od to printout a random decimal number?
```sh
od -d /dev/urandom
```
##### od -d selects unsigned decimal 2-byte units from the data generated from urandom script


8. Type mount (with no parameters) and try to interpret the output. 
```sh
mount
```
##### The list of mounted filesystems is printed

9. Archive the contents of your home directory using tar. Compress the tar file with gzip. Now uncompress and unarchive the . tar . gz file using cat, tar and gzip on one command line.

```sh
* tar -czvf hello.tar.gz /home/ubuntu
-c compress
-f file
-v verbosely list process files
-z gzip

* tar -xzvf hello.tar.gz -C /home/ubuntu
-x uncompress
-f file
-v verbosely list process files
-z gzip
```
10. Use find to compile a list of all directories in the system, redirecting the output so that the list of directories ends up in a file called directories. txt and the list of error messages ends up in a file called errors. txt
```sh
find / 2 > /home/ubuntu/errors.txt
```
```sh
find / 1 > /home/ubuntu/directories.txt
```

2 gives standard errors
1 gives standard output

11.  Run sleep 15 in the foreground, suspend it and then put it into the background. Confirm it is running in background. Bring the job back into the foreground 

```sh
sleep 15s

ctrl-z

bg

jobs

fg

sleep is used to stop a process for certain time 
bg for back ground
fg for foreground
```

12. Run sleep 15 in the background, and then use kill to terminate the process by its job number. Repeat, except this time kill the process by specifying its PID
```sh
sleep 15 &
kill %3
```
```sh
sleep 15 &
kill 5739
```

& is used to make process run in background
% is used to kill a process by job number

kill 5739 is used to kill a process by process id


13. Run sleep 15 in the background, and then use kill to suspend the process. 14.show all processes that are executing. 

```sh
 sleep 15 &
```
```sh
kill -TSTP 5739
```

TSTP is used to stop a process with polite stop signal


14. show all processes that are executing. 
```sh
ps -aux | less
```

15. Display the process hierarchy. Look for the init process. See if you can identify important system deamons. Can you also identify your shell and its sub processes?

```sh 
ps -aeH
```
* -aeH shows process with its hierarchy

16. show all processes that you are executing 
```sh
ps
```
shows process that are executing

17. Start a sleep 300 process running in the background. Log off the server, and log back in again. List all the processes that you are running. What happened to your sleep process? Now repeat, except this time make sure the process is running after logout.
 
1.When we execute the command sleep 300 and relog-in to machine,process sleep was already terminated.
2.When we execute the command nohup sleep 300 and relog-in to machine,process sleep is still running.

18. Try combining the commands car ninexistent and echo hello using each of these operators.

```sh
cat kaushik && echo hello
```

19. What does xargs command do? Can you combine it with find and grep to find yet another way of searching all files in the /home subdirectory tree for the word hello

```sh
find /home | xargs grep hello
```
* Build and execute command lines from standard input. Output of files from home are taken by grep to find the files with keyword hello

20. ps aux --sort=-pcpu | head

```sh
-pcpu is used specify column with cpu consumption without interfering with sorting and to display top most data
```
21. telnet www.google.com 80
```sh 
telnet is used to connect to a particular website on a particular port
```
22. ping yahoo.com

```sh
ping is used to check if a particular website is reachable
```
23. traceroute www.yahoo.com
```sh
traceroute is used to print the route packets take to network host
```
24. wget http://www.cloudera.com/index.html 
```sh
wget is used to get particular data from desired location
```
25. ps -ux | sed "s/\$$USER/me/"
```sh
ps -ux is used to get process with user names and using sed the user name is modified in the output
``` 
26. who | while read username junk ; do awk -F: '($1 == "'$username'") {print $5}' /etc/passwd ; done | sort -u
27. awk -F : '{print $1, $3, $3}' /etc/passwd
28. awk 'NR>2' mouna.text
29. guess=-1
typeset -i num=0

echo -e "guess.bash - Guess a number between 1 and 100\n"

### Generate random number
(( answer = RANDOM % 100 + 1 ))

### Play game
while (( guess != answer )); do
	num=num+1
	read -p "Enter guess $num: " guess
	if (( guess < answer )); then
		echo "Higher..."
	elif (( guess > answer )); then
		echo "Lower..."
	fi
done
echo -e "Correct! That took $num guesses.\n"
30. for file in *.txt; do
    mv "$file" "`basename "$file" .txt`.text"
    done
32. 
PATH=$PATH:.
export EDITOR='vi'
export VISUAL='vi'
source .bash_profile
