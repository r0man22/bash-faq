#testing empty directory (including hidden files)
shopt -s nullglob dotglob
files=($HOME/Desktop/bashfaq/davay/*)  # Tam yol kullanmak
(( ${#files[*]} )) || echo "directory is empty"  # Dizin boşsa mesaj yazdır
shopt -u nullglob dotglob

#alternative
if (shopt -s nullglob dotglob; f=(*); ((! ${#f[@]}))); then
    echo "The current directory is empty."
fi

#check how many files
shopt -s nullglob dotglob
files=(*)
echo "The current directory contains ${#files[@]} things."

#check first file
shopt -s dotglob
files=(*)
if [[ -e ${files[0]} || -L ${files[0]} ]]; then
    echo "The current directory is not empty.  It contains:"
    printf '%s\n' "${files[@]}"
fi

#compgen
if (shopt -s dotglob; : *; compgen -G '*' >/dev/null); then
    echo "The current directory is not empty."
else
    echo "The current directory is empty."
fi

#with shopt -s exglob
if (shopt -s extglob; compgen -G '@(*|.[!.]*|..?*)' >/dev/null); then
    echo "The current directory is not empty."
else
    echo "The current directory is empty."
fi

#failglob// you dont want to have a blank output. So you get an error when it's blank
if ( shopt -s dotglob failglob; : ./* ) 2>/dev/null; then
    echo "The current directory is not empty."
else
    echo "The current directory is empty."
fi

#eval
shopt -s dotglob failglob
if command eval ': ./*' 2> /dev/null; then
    echo "The current directory is not empty."
else
    echo "The current directory is empty."
fi

#function
any_match () { local IFS=; { : $@ ;} 2> /dev/null ;}
if any_match './*'; then
    echo "The current directory is not empty."
else
    echo "The current directory is empty."
fi

#with external command
set -- * .[!.]* ..?*
for f in "$@"; do
  if test -e "$f" || test -L "$f"; then
    echo "directory is non-empty"
    break
  fi
done


#count
n=$(find . -type f -exec printf %.0s. {} + | wc -m)
printf "There are %d files.\n" "%n"

#find
find "$somedir" -type f -exec echo Found unexpected file {} \;

