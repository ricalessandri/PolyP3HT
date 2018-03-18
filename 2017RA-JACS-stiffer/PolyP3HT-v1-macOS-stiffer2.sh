#!/bin/bash
 
no_monomers=$1
size_1=${#no_monomers}
if [ $size_1 -eq 0 ] ; then
  echo ""
  echo "Please pass the number of monomers you want to the script"
  echo "(should be a multiple of 2!). Example:"
  echo "                                      "
  echo " ./PolyP3HT-v1.sh  12"
  exit
fi

# polymerize P3HT commands
for_genconf=$(python -c "print( $no_monomers / 2 )") # this number must be half the number of monomers one wants
echo ${for_genconf} ${for_genconf} ${for_genconf} ${for_genconf} ${for_genconf} ${for_genconf}
gmx genconf -f p3ht_dimer_repeat_unit_50atoms.gro  -nbox 1 ${for_genconf}  1 -rot no -o polymer.pdb

echo 0 1 | gmx pdb2gmx -f polymer.pdb -ff p3ht_gromos_v_2017RA-JACS-stiffer2 -ter yes -o polymer.gro -p polymer.top

python shift-resnr.py polymer.top polymerout.top

sh top2itp-macOS.sh ${no_monomers} header-stiffer

# clean-up
rm polymer.pdb polymer.top polymerout.top posre.itp
mv polymerout.itp p3ht_n${no_monomers}_2017RA-JACS-stiffer2.itp
mv polymer.gro    p3ht_n${no_monomers}.gro

