#!/bin/sh

if [ $# -ne 1 ]
then
  echo "Error: no directory specified"
  exit 1
fi

cd "$1"

if [ $? -ne 0 ]
then
  echo "Error: change directory failed"
  exit 1
fi

find . -name '*.h' -print0 | xargs -0 perl -pi -e 's/\#import\s*\"/\#import \<RestKit\//g'
find . -name '*.h' -print0 | xargs -0 perl -pi -e 's/\#import\ \<(.*)\"/\#import\ \<\1\>/g'