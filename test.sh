#!/bin/bash

set -x
set -e

echo "welcome"

age=26

if [ age -ge 18 ] then;
  echo "eligible for voting"
else;
  echo "ineligible"
fi

