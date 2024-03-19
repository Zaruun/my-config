#!/bin/bash

dir="./guiapps"
cd $dir

files=(*)
to_install=()

for file in "${files[@]}"; do
    read -rp "Should I run \"$file\" ? [y/n]: " answer
    case $answer in 
        [Yy]* )
            to_install+=($file)
            echo "$file will be runned"
            echo ""
            ;;
        [Nn]* )
            echo "Skipping $file"
            echo ""
            ;;
        * )
            echo "Wrong anwswer"
            echo ""
            ;;
    esac
done

for file in "${to_install[@]}"; do
    bash ./$file
done

echo ""
echo "Installation completed!"
