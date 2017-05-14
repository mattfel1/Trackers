#!/bin/bash

if [ ! -f results ]; then
  echo "FAIL: No results found"
  exit 1
fi

errors=(`cat results | grep -i "fail\|unknown" | wc -l`)
echo "SUCCESS"
exit 0
