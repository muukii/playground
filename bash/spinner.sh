#!bin/bash

set -e 
jobs_await() {    
  local spinners=('🌕' '🌖' '🌗' '🌘' '🌑' '🌒' '🌓' '🌔')
  while true; do
    for spinner in ${spinners[@]}; do
      printf "  $spinner  \r" > /dev/stderr
      sleep 0.05
    done
  done
}

jobs_await

