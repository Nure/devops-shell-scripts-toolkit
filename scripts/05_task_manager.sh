#!/bin/bash

TASKS_FILE="tasks.txt"
touch "$TASKS_FILE"

while true; do
  echo "My Taks List:"
  cat -n "$TASKS_FILE"
  echo
  echo "1. Add Task"
  echo "2. Remove Task"
  echo "3. Exit"
  read -p "Choose an option: " opt

  case $opt in
    1)
      read -p "Enter new task: " task
      echo "$task" >> "$TASKS_FILE"
      ;;
    2)
      read -p "Enter task number to remove: " num
      sed -i "${num}d" "$TASKS_FILE"
      ;;
    3)
      echo "Bye!"
      exit 0
      ;;
    *)
      echo "Invalid option."
      ;;
  esac
done
