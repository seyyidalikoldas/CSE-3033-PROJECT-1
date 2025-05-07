#!/bin/bash

if [[ $# -ne 1 ]] || [[ ! $1 =~ ^[0-9]+$ ]]; then
  echo "Usage: $0 <integer>"
  exit 1
fi

limit=$1

is_prime() {
  local num=$1
  if ((num < 2)); then
    return 1
  fi
  for ((i = 2; i * i <= num; i++)); do
    if ((num % i == 0)); then
      return 1
    fi
  done
  return 0
}

echo "Hexadecimal values of prime numbers less than $limit:"
echo "-----------------------------------------------------"

for ((num = 2; num < limit; num++)); do
  if is_prime "$num"; then
    printf "Hexadecimal of %d is %X\n" "$num" "$num"
  fi
done

echo "-----------------------------------------------------"

