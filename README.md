# PolyP3HT : Polymerize Atomistic P3HT

Handy script to generate topology and geometry files of arbitrarily long atomistic P3HT chains.

Two force fields are available:

1. The GROMOS 53A6-based parameters published in 
[JACS **2017**, *139*, 3697-3705](https://pubs.acs.org/doi/abs/10.1021/jacs.6b11717) - see the **`2017RA-JACS`** folder; 

2. The "Q-Forced" parameters (still relying on the GROMOS 53A6 Lennard-Jones parameters) published
in [Chemrxiv **2020**](https://doi.org/10.26434/chemrxiv.12277931) - see the **`2020RA-qforce`** folder.
This version improves the bonded parameters of P3HT, which were otherwise too flexible 
with the GROMOS standard parameters for angles and improper dihedrals in particular. 
This model is *recommended for use in combination with subsequent quantum chemical calculations* 
on the P3HT geometries (see, *e.g*, [Chemrxiv **2020**](https://doi.org/10.26434/chemrxiv.12277931)).

Both can be also downloaded from [Figshare](http://doi.org/10.6084/m9.figshare.5853060), 
which contains also a few example files obtained with the scripts.
"Stable" releases will be uploaded to [Figshare](http://doi.org/10.6084/m9.figshare.5853060),
while this repo is a good place where to raise issues or make improvements.


## Use

```
cd 2017RA-JACS
./PolyP3HT.sh       12   # on Linux
./PolyP3HT-macOS.sh 12   # on macOS
```

where 12 is the desired number of monomers (note only that the number of monomers in the chain *must* 
be a multiple of 2). 
Note that the files `shift-resnr.py`, `residuetypes.dat`, `p3ht_dimer_repeat_unit_50atoms.gro`, `header`, 
and `top2itp.sh` must be in the folder where the script is being exectured along with the directory 
`p3ht_gromos_v_2017RA-JACS.ff/` which contains the force field.
The commands are analogous for the `2020RA-qforce` version. 
The output files are in GROMACS format (`itp` and `gro` for the topology and geometry, respectively).
More details are also included in the Supporting Information of [Chemrxiv **2020**](https://doi.org/10.26434/chemrxiv.12277931).


## License

<pre><code>
Copyright 2018 University of Groningen

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</code></pre>

