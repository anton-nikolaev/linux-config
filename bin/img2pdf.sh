#!/bin/bash

for i in trello*; do
    /usr/bin/convert -verbose -resize 1024 $i tmp;
    /bin/mv tmp $i;
done

/usr/bin/convert -verbose trello* out.pdf
