#Recurse and print matching lines
grep -r -- "$search" .

#Recurse and print only the filenames
grep -r -l -- "$search" .

find . -type f -exec grep -l -- "$search" {} +

#If your filenames contain spaces, quotes or other metacharacters
find . -type f -print0 | xargs -0 grep -l -- "$search"
