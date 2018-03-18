#!/usr/bin/python
#-------------------------------------------------------------------------------------------------#
#----------------------------------- shift-resnr.py ----------------------------------------------#
#-- Riccardo Alessandri --------------------------------------------------------------------------#
#-- (based on "shift-itp.py by Jaakko Uusitalo) --------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------#
# The script shifts the residue numbers of P3HT from 1 1 2 2 3 3 4 4 5 5 ... (i.e., dimer-based   #
# resid) to 1 2 3 4 5 6 7 8 (monomer-based resid).                                                #
#                                                                                                 #
# USE (the script needs two arguments):                                                           #
#   ./shift-resnr.py  polymer.itp  polymer-out.itp                                                #
#-------------------------------------------------------------------------------------------------#

import numpy as np
import sys

INPUT = sys.argv[1]
OUTPUT = sys.argv[2]


def checkLine(line):
    #global status
    if 'moleculetype' in line:
        return 'mtype'
    elif 'atoms' in line:
        return 'atoms'
    elif 'virtual_sitesn' in line:
        return 'virtual_sitesn'
    elif 'bonds' in line:
        return 'bonds'
    elif 'constraints' in line:
        return 'constraints'
    elif 'pairs' in line:
        return 'pairs'
    elif 'angles' in line:
        return 'angles'
    elif 'exclusions' in line:
        return 'exclusions'
    elif 'dihedrals' in line:
        return 'dihedrals'
    elif 'system' in line:
        return 'system'
    elif 'molecules' in line:
        return 'molecules'
    else:
        print line
        print 'Something is wrong. [ gromacs itp section ] not recognized.'


def makeOutput(line,status):
    global sulfur_counter, SHIFT
    list = line.split()
    if len(list) == 0:
        return '\n'
    if status == 'atoms':
       if str(list[1]) == 'S':
            sulfur_counter = sulfur_counter + 1 # keeping track of the number of sulfur atoms
            SHIFT = int(sulfur_counter) / 2     # the SHIFT changes every 2 monomers
            list[2] = str(int(list[2]) + SHIFT) # shifts the residue number
            # The following won't print to the OUTPUT the total_charge that might be present in the INPUT file
            return '{0[0]:>6}{0[1]:>11}{0[2]:>7}{0[3]:>7}{0[4]:>7}{0[5]:>7}{0[6]:>11}{0[7]:>10}\n'.format(list)
       else:
            list[2] = str(int(list[2]) + SHIFT) # shifts the residue number
            # The following won't print to the OUTPUT the total_charge that might be present in the INPUT file
            return '{0[0]:>6}{0[1]:>11}{0[2]:>7}{0[3]:>7}{0[4]:>7}{0[5]:>7}{0[6]:>11}{0[7]:>10}\n'.format(list)
    else:
        return line


def main():
    file = open(INPUT, 'r')
    out = open(OUTPUT, 'w')
    lines = file.readlines()
    # initializing
    global sulfur_counter, SHIFT
    #global status
    status = 'none'
    sulfur_counter = 0
    #SHIFT = 0          
    for line in lines:
        if line[0] == '[':
            status = checkLine(line)
            out.write(line)
            continue
        if not line[0] == ';' and not line[0] == '#':
            out.write(makeOutput(line,status))
        else:
            out.write(line)
    print("Done!")
    file.close()
    out.close()

main()

