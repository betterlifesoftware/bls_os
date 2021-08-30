#!/bin/sh
#crea cartella printing e cartella temp_printing
while true
do
        for file in /home/user/printing/*; do
                echo "$file" "$file"
                filename="$(echo "$file" | rev | cut -d'/' -f 1 | rev)"
                echo "$filename"
                localpath='printing/'$filename
                globalpath=${file//$localpath/}
                echo "$globalpath"
                temppath=$globalpath"temp_printing/"
                echo "$temppath"
                mv "$file" "$temppath"
                sleep 10
                printingpath=${file//$filename/}
                echo "$printingpath"
                tempprintingfile=$temppath$filename
                mv "$tempprintingfile" "$printingpath"
                break 1
        done
        sleep 10
done
