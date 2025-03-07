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


#değişkenin değerini bir array (dizi) yapma
aref=realarray
IFS=' ' read -d '' -ra "$aref" <<<'words go into array elements'
echo "${realarray[0]}" #output: words


#EOF icinde verilen degeri bir degiskenin degerine yazma
ref=realvariable
IFS= read -r -d '' -- "$ref" <<EOF
The contents
go here.
EOF
echo "${realvariable"}

#declare ile ref tutma
ref=realvariable
declare -- "${ref}=contents"

echo "$realvariable"   # Çıktı: contents
