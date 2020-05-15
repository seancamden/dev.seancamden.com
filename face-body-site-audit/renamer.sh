#!/bin/bash
for i in *.html ; do
    urlline="$(sed -n 5849p $i)";
    urlloc="$(echo $urlline | grep -Eo 'https://www.face-body.com[^"]+' | head -1)";
    filename="$(echo $urlloc | sed 's|https://||' | sed 's|\.|-|g' | sed 's|/|-|g' | sed 's|-$||')";
    #echo $filename >> temp.file;
    echo "<!--#include virtual=\"top.shtml\" -->" > $i;
    echo $urlline >> $i;
    echo "<!--#include virtual=\"bottom.shtml\" -->" >> $i;
    mv "${i}" "${filename}.shtml";
done
