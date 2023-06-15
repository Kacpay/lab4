#!/bin/bash

if [ "$1" == "--date" ]; then
    date

elif [ "$1" == "--logs" ]; then
    if [ -z "$2" ]; then
        num_logs=100
:<<C
    else
        num_logs=$2
C
    fi

    for ((i=1; i<=$num_logs; i++)); do
        nazwa="log$i.txt"
        echo "Nazwa pliku: $nazwa" >> $nazwa
        echo "Nazwa skryptu: $0" >> $nazwa
        echo "Data: $(date)" >> $nazwa
    done
:<<C
elif [ "$1" == "--help" ]; then
    echo "Dostępne opcje:"
    echo "  --date    - wyświetla dzisiejszą datę"
    echo "  --logs    - tworzy automatycznie 100 plików logx.txt"
    echo "  --logs N  - tworzy automatycznie N plików logx.txt"

else
    echo "Nieznana opcja. Użyj '$0 --help' aby wyświetlić dostępne opcje."
fi
C
