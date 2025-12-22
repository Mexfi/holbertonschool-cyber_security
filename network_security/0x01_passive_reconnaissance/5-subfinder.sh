#!/bin/bash
subfinder -d $1 -silent | tee >(awk '{ "dig +short "$1 | getline ip; if (ip!="") print $1","ip }' > $1.txt)
