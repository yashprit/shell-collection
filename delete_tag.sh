#!/bin/sh

for (( c=$1; c<=$2; c++ ))
do
	TAGNAME=<tag-name>
	echo $TAGNAME
   	git tag -d $TAGNAME
   	git push origin :refs/tags/$TAGNAME
done
