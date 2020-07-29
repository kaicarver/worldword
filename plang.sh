#!/bin/sh
WORD=$1
curl "https://en.wikipedia.org/wiki/$WORD" > "$WORD.wikipedia.html"  2> /dev/null
./plang.pl "$WORD.wikipedia.html"
