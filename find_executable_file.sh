#!/bin/bash
#查找系统可执行文件

IFS=:
for folder in $PATH
do
    echo "目录：$folder"
    for file in $folder/*
    do
        if [[ -x $file ]]
        then
            echo "$file "
        fi
    done
done


