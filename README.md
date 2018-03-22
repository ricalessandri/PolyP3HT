# PolyP3HT : Polymerize Atomistic P3HT

Handy script to generate topology and geometry files of arbitrarily long atomistic P3HT chains.
The released version, which works for the GROMOS 53A6-based published parameters in [JACS 139 (10), 3697-3705](https://pubs.acs.org/doi/abs/10.1021/jacs.6b11717), can be found on [my Figshare page](https://figshare.com/articles/Polymerize_Atomistic_P3HT/5853060).

This repository contains also a version which generates a *stiffer* version of the P3HT backbone. This improves the planarity of the polythiophene backbone, which was otherwise too flexible with the GROMOS standard force constant for the improper dihedrals. This model is *recommended* for use in combination with subsequent quantum mechanical calculations on the P3HT geometries.


### Use

<pre><code>./PolyP3HT.sh 12
</code></pre>

where 12 is the desired number of monomers (note only that the number of monomers in the chain *must* be a multiple of 2). Make sure the files *shift-resnr.py*, *residuetypes.dat*, *p3ht_dimer_repeat_unit_50atoms.gro*, *header*, and *top2itp.sh* are in the folder where the script is being exectured along with the directory *p3ht_gromos_v_2017RA-JACS.ff/* which contains the force field. The output files are in GROMACS format (`itp` and `gro` for the topology and geometry, respectively).

