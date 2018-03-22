# PolyP3HT : Polymerize Atomistic P3HT

Handy script to generate topology and geometry files of arbitrarily long atomistic P3HT chains.
The released version, which works for the GROMOS 53A6-based published parameters in [JACS 139 (10), 3697-3705](https://pubs.acs.org/doi/abs/10.1021/jacs.6b11717), can be found on [my Figshare page](https://figshare.com/articles/Polymerize_Atomistic_P3HT/5853060).

This repository contains also a version which generates a *stiffer* version of the P3HT backbone. This improves the planarity of the polythiophene backbone, which was otherwise too flexible with the GROMOS standard force constant for the improper dihedrals. This model is *recommended* for use in combination with subsequent quantum mechanical calculations on the P3HT geometries.


## Use
