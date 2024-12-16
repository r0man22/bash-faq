
#read without changing spaces and tabs within the line
while IFS= read -r line; do
	printf '%s\n' "$line"
done < "$file"

#changing spaces and tabs
while read -r line; do
	printf '%s\n' "$line"
done < "$file"

#assign columns from file to variable
while read -r first second phone; do
	printf '%s\n' "$second"
done < "$file"


#/etc/passwd
while IFS=: read -r user pass uid gid gecos home shell; do
	printf '%s: %s\n' "$user" "$shell"
done < /etc/passwd


#skip
while read -r line; do
	[[ $line = \#* ]] && continue
	printf '%s\n' "$line"
done < "$file"
