#!/bin/sh


if [ ! -f wait-for.sh ]; then
   wget https://raw.githubusercontent.com/eficode/wait-for/master/wait-for
   mv wait-for wait-for.sh
fi


docker build .