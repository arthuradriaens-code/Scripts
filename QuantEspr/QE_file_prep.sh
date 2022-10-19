#/bin/sh

cif2cell "$1" -p quantum-espresso -o .input

cat .input | sed '7a\&CONTROL\n  calculation="'"scf"'",\n  outdir="'"."'",\n  prefix="'"file"'",\n  pseudo_dir="'"."'"\n  verbosity="'"low"'",\n  tprnfor=.true.,\n  tstress=.true.,\n/' > .inbetweenout
cat .inbetweenout | sed '22a\  ecutwfc=50,\n  ecutrho=200,\n  input_dft="'"pbe"'",\n  occupations="'"smearing"'",\n  smearing="'"mv"'",\n  degauss=0.005d0,'> .inbetweenout2
cat .inbetweenout2 | sed '29a\&ELECTRONS\n  conv_thr=1d-08,\n  mixing_beta=0.7d0,\n/' > "$2"
echo "K_POINTS {automatic}\n  7 7 7 0 0 0" >> "$2"

rm .input
rm .inbetweenout
rm .inbetweenout2
