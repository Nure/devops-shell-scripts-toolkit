#!/bin/bash

echo "Welcome to Bash Calculator!"
read -p "Enter first number: " a
read -p "Enter second number: " b

echo "Choose operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

read -p "Enter choice [1-4]: " choice

case $choice in
  1) echo "Result: $((a + b))";;
  2) echo "Result: $((a - b))";;
  3) echo "Result: $((a * b))";;
  4) 
    if [ "$b" -ne 0 ]; then
      echo "Result: $((a / b))"
    else
      echo "Error: Division by zero"
    fi
    ;;
  *) echo "Invalid choice";;
esac
