#variable length
varname="Hello"
echo "${#varname}"

#with awk
awk 'BEGIN {print length(ARGV[1])}' "$varname"

#array length
"${#arrayname[@]}"

#array value length
"${#arrayname[i]}"
