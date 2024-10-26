#! /usr/bin/bash

touch mytext.txt
echo "Hola mundo" > mytext.txt
cat mytext.txt
mkdir backup
mv mytext.txt backup 
ls backup
rm backup/mytext.txt
rmdir backup
