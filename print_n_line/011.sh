sed -n "${n}p" "$file"

sed "${n}q;d" "$file"

tail -n "+$n" "$file" | head -n 1

awk -v n="$n" 'NR==n{print;exit}' "$file"

x=3 y=4
sed -n "$x,${y}p;${y}q;" "$file"                # Print lines $x to $y; quit after $y.
head -n "$y" "$file" | tail -n "$((y - x + 1))"   # Same
head -n "$y" "$file" | tail -n "+$x"            # If your tail supports it
awk -v x="$x" -v y="$y" 'NR>=x{print} NR==y{exit}'

m=0
while ((m++ < n)) && read -r _; do
    :
done

head -n 1

mapfile -ts " $(( n - 1 )) " -n 1 x < " $file " 
printf  '%s\n'  " $x "
