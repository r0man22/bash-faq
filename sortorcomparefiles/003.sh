#latest
unset -v latest
for file in /root/Desktop/*; do
	[[ $file -nt $latest ]] && latest=$file
done

#oldest
unset -v oldest
for file in /root/Desktop/*; do
        [[ $file -nt $oldest ]] && latest=$oldest
done

#or
unset -v latest time
while IFS= read -r -d '' line; do
  t=${line%% *} t=${t%.*}   # truncate fractional seconds
  ((t > time)) && { latest=${line#* } time=$t; }
done < <(find "$dir" -type f -printf '%T@ %p\0')
