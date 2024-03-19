#!/bin/bash

dir="./guiapps"
cd $dir
files=(*)

for file in "${files[@]}"; do
    read -rp "Should I run \"$file\" ? [y/n]: " answer
    case $answer in 
        [Yy]* )
            echo ""
            echo "Running $file"
            bash "$dir/$file"
            ;;
        [Nn]* )
            echo ""
            echo "Skipping $file"
            ;;
        * )
            echo ""
            echo "Wrong anwswer"
            ;;
    esac
done
