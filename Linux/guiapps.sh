#!/bin/bash

dir="./guiapps"
cd $dir

files=(*)
to_install=()

for file in "${files[@]}"; do
    read -rp "Should I run \"$file\" ? [y/n]: " answer
    echo ""
    case $answer in 
        [Yy]* )
            to_install+=($file)
            echo "$file will be runned"
            ;;
        [Nn]* )
            echo "Skipping $file"
            ;;
        * )
            echo "Wrong anwswer"
            ;;
    esac
done

for file in "${to_install[@]}"; do
    bash ./$file
done
