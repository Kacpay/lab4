#!/bin/bash

if [ "$1" == "-d" ] || [ "$1" == "--date" ]; then
    date

elif [ "$1" == "-l" ] || [ "$1" == "--logs" ]; then
    if [ -z "$2" ]; then
        num_logs=100
    else
        num_logs=$2
    fi

    for ((i=1; i<=$num_logs; i++)); do
        nazwa="log$i.txt"
        echo "Nazwa pliku: $nazwa" >> $nazwa
        echo "Nazwa skryptu: $0" >> $nazwa
        echo "Data: $(date)" >> $nazwa
    done

elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Dostępne opcje:"
    echo "  -d, --date    - wyświetla dzisiejszą datę"
    echo "  -l, --logs    - tworzy automatycznie 100 plików logx.txt"
    echo "  -l N          - tworzy automatycznie N plików logx.txt"
    echo "  -h, --help    - wyświetla dostępne opcje"

else
    echo "Nieznana opcja. Użyj '$0 --help' aby wyświetlić dostępne opcje."
fi

