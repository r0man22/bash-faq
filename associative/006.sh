#dict
typeset -A homedir
homedir=(
    [roman]=/home/roman
    [norman]=/home/norman
)

homedir[jal]=/home/jal

for user in "${!homedir[@]}"; do
    printf 'Home directory of user %q is: %q\n' "$user" "${homedir[$user]}"


#ssh
declare -A commands
commands=(
  [host1]="mvn clean install && cd webapp && mvn jetty:run"
  [host2]="..."
)

for host in "${!commands[@]}"; do
    ssh -- "$host" "${commands[$host]}"
done


#Being able to hold two values ​​in one variable
arr1=(first array)
arr2=(second array)
declare -n ref
if [[ $someoption ]]; then
    ref=arr2
else
    ref=arr1
fi
for i in "${ref[@]}"; do ...; done


#nameref
realvariable=contents
ref=realvariable
printf '%s\n' "${!ref}"
