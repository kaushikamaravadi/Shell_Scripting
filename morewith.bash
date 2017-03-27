read -p 'username: ' uservar
stty -echo
printf 'password: ' passvar
read password
stty echo
echo Thank you $uservar we have your password now $passvar

