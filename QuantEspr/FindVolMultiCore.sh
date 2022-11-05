#!/bin/sh

BaseValue=$(grep "A = " "$1" | sed 's/.[^=]*=\(.[^ \t]*\)[ \t]*\(.[^ \t]*\)\(.*\)/\2/') 
#I don't know jet how I can sample these so they have to be put in manually for now
x_length="$2"
y_length="$3"
z_length="$4"
BaseVol=$(echo "$BaseValue * $BaseValue * $BaseValue * $x_length * $y_length * $z_length /( 0.529177 * 0.529177 * 0.529177)" | bc)
Min5Value=$(echo "$BaseValue - 0.05 * $BaseValue" | bc)
VolMin5=$(echo "$BaseVol - 0.05 * $BaseVol" | bc)
sed "s/A =.*/A = $Min5Value/g" $1 > Min5File.in
Min10Value=$(echo "$BaseValue - 0.10 * $BaseValue" | bc)
VolMin10=$(echo "$BaseVol - 0.10 * $BaseVol" | bc)
sed "s/A =.*/A = $Min10Value/g" $1 > Min10File.in
Min15Value=$(echo "$BaseValue - 0.15 * $BaseValue" | bc)
VolMin15=$(echo "$BaseVol - 0.15 * $BaseVol" | bc)
sed "s/A =.*/A = $Min15Value/g" $1 > Min15File.in
Min20Value=$(echo "$BaseValue - 0.20 * $BaseValue" | bc)
VolMin20=$(echo "$BaseVol - 0.20 * $BaseVol" | bc)
sed "s/A =.*/A = $Min20Value/g" $1 > Min20File.in

mpirun --use-hwthread-cpus pw.x -input Min5File.in > Min5File.out
mpirun --use-hwthread-cpus pw.x -input Min10File.in > Min10File.out
mpirun --use-hwthread-cpus pw.x -input Min15File.in > Min15File.out
mpirun --use-hwthread-cpus pw.x -input Min20File.in > Min20File.out

echo -n $VolMin5 > VolVsE.txt #1 to remove previous
echo -n "	" >> VolVsE.txt
grep "!    total energy              =" Min5File.out | sed 's/.[^=]*=\(.[^ \t]*\)[ \t]*\(.[^ \t]*\)\(.*\)/\2/' >> VolVsE.txt
echo -n "\n" >> VolVsE.txt #yes this looks stupid sorry
rm Min5File.out

echo -n $VolMin10 >> VolVsE.txt
echo -n "	" >> VolVsE.txt
grep "!    total energy              =" Min10File.out | sed 's/.[^=]*=\(.[^ \t]*\)[ \t]*\(.[^ \t]*\)\(.*\)/\2/' >> VolVsE.txt
echo -n "\n" >> VolVsE.txt
rm Min10File.out

echo -n $VolMin15 >> VolVsE.txt
echo -n "	" >> VolVsE.txt
grep "!    total energy              =" Min15File.out | sed 's/.[^=]*=\(.[^ \t]*\)[ \t]*\(.[^ \t]*\)\(.*\)/\2/' >> VolVsE.txt
echo -n "\n" >> VolVsE.txt
rm Min15File.out

echo -n $VolMin20 >> VolVsE.txt
echo -n "	" >> VolVsE.txt
grep "!    total energy              =" Min20File.out | sed 's/.[^=]*=\(.[^ \t]*\)[ \t]*\(.[^ \t]*\)\(.*\)/\2/' >> VolVsE.txt
echo -n "\n" >> VolVsE.txt
rm Min20File.out



