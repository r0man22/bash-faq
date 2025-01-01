# if you want capture output(stdout and stderr)
output=$(command 2>&1)

#if you want exit status in script
command
status=$?
echo "$status"

#command exit status message
if command &> /dev/null; then
	printf "it succeeded\n"
else
	printf "it failed\n"
fi

#or
if output=$(command); then
	printf "it succeeded\n"
fi

#exit status from pipeline
set -o pipefail
if ! grep foo somelogfile | head -n5; then
    printf "uh oh\n"
fi

#save stderr //step1 file descriptor created/ step2 stderr to stdout/ step3 stdout to created file descriptor
output=$(command 3>&2 2>&1 1>&3-)
#or
{ output=$(command 2>&1 1>&3-) ;} 3>&1

#save stderr and stdout different variable
cmd() { curl -s -v http://www.google.fr; }

result=$(
    { stdout=$(cmd) ; } 2>&1
    printf "this line is the separator\n"
    printf "%s\n" "$stdout"
)
var_out=${result#*this line is the separator$'\n'}
var_err=${result%$'\n'this line is the separator*}
