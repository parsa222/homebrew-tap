#!/bin/sh

CC=${CC:=cc}

${CC} gentables.c -o gentables -Wall -W -O2
./gentables >tables.c
./gentables h >tables.h
echo Tables generated
