#unbuffer
tail -f logfile | unbuffer grep 'foo bar' | awk ...

#stdbuf
tail -f logfile | stdbuf -oL grep 'foo bar' | awk ...

#we can watch it instantly with the less
less program.log

#coproc
coproc tail -f logfile


