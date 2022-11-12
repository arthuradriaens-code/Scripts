ssconvert $1 $2
column -s, -t < $2 | less -#2 -N -S
