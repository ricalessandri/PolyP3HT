#!/bin/bash

no_monomers=$1
headerfile=$2
size_1=${#no_monomers}
size_2=${#headerfile}
if [ $size_1 -eq 0 -o ${size_2} -eq 0 ] ; then
echo ""
  echo "Somehow top2itp.sh didn't get the number of monomers AND/OR the headfile name.. check that!"
  exit
fi

no_monomers=$1

# Remove "A" and "B" from the atom labels
sed -i 's/ST1A/ST1/g' polymerout.top
sed -i 's/CT2A/CT2/g' polymerout.top
sed -i 's/CT3A/CT3/g' polymerout.top
sed -i 's/CT4A/CT4/g' polymerout.top
sed -i 's/HT4A/HT4/g' polymerout.top
sed -i 's/CT5A/CT5/g' polymerout.top
sed -i 's/HT5A/HT5/g' polymerout.top
sed -i 's/C06A/C06/g' polymerout.top
sed -i 's/H06A/H06/g' polymerout.top
sed -i 's/H07A/H07/g' polymerout.top
sed -i 's/C07A/C07/g' polymerout.top
sed -i 's/H08A/H08/g' polymerout.top
sed -i 's/H09A/H09/g' polymerout.top
sed -i 's/C08A/C08/g' polymerout.top
sed -i 's/H10A/H10/g' polymerout.top
sed -i 's/H11A/H11/g' polymerout.top
sed -i 's/C09A/C09/g' polymerout.top
sed -i 's/H12A/H12/g' polymerout.top
sed -i 's/H13A/H13/g' polymerout.top
sed -i 's/C10A/C10/g' polymerout.top
sed -i 's/H14A/H14/g' polymerout.top
sed -i 's/H15A/H15/g' polymerout.top
sed -i 's/C11A/C11/g' polymerout.top
sed -i 's/H16A/H16/g' polymerout.top
sed -i 's/H17A/H17/g' polymerout.top
sed -i 's/H18A/H18/g' polymerout.top

sed -i 's/ST1B/ST1/g' polymerout.top
sed -i 's/CT2B/CT2/g' polymerout.top
sed -i 's/HT2B/HT2/g' polymerout.top
sed -i 's/CT3B/CT3/g' polymerout.top
sed -i 's/CT4B/CT4/g' polymerout.top
sed -i 's/HT4B/HT4/g' polymerout.top
sed -i 's/CT5B/CT5/g' polymerout.top
sed -i 's/C06B/C06/g' polymerout.top
sed -i 's/H06B/H06/g' polymerout.top
sed -i 's/H07B/H07/g' polymerout.top
sed -i 's/C07B/C07/g' polymerout.top
sed -i 's/H08B/H08/g' polymerout.top
sed -i 's/H09B/H09/g' polymerout.top
sed -i 's/C08B/C08/g' polymerout.top
sed -i 's/H10B/H10/g' polymerout.top
sed -i 's/H11B/H11/g' polymerout.top
sed -i 's/C09B/C09/g' polymerout.top
sed -i 's/H12B/H12/g' polymerout.top
sed -i 's/H13B/H13/g' polymerout.top
sed -i 's/C10B/C10/g' polymerout.top
sed -i 's/H14B/H14/g' polymerout.top
sed -i 's/H15B/H15/g' polymerout.top
sed -i 's/C11B/C11/g' polymerout.top
sed -i 's/H16B/H16/g' polymerout.top
sed -i 's/H17B/H17/g' polymerout.top
sed -i 's/H18B/H18/g' polymerout.top

# Multiple dihedral FIX!
sed -i '' 's/     1    gd_43/     9    gd_43/' polymerout.top
sed -i '' 's/     1    gd_42/     9    gd_42/' polymerout.top

# Change P3HT name
sed -i 's/Protein/P3HT/g' polymerout.top

# Remove last lines
sed -n '/; Include Position restraint file/q;p' polymerout.top > polymerout.itp

# Remove first 22 lines
sed -i -e 1,22d                              polymerout.itp

cp $headerfile header_in_use
header=./header_in_use
sed -i "s/NO_MONOMERS/${no_monomers}/" header_in_use

cat "$header" "polymerout.itp" > polymerout2.itp

cp polymerout2.itp polymerout.itp 
rm polymerout2.itp header_in_use
