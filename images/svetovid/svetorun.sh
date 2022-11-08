#!/bin/bash

# Compile and run Java programs that use Svetovid library
# This script is written to satisfy most usecases but since
# students can sometimes be creative you might need to
# adapt it a bit

_f_usage() {
  printf "Usage: svetorun [options] <class>\n\n"
  printf "\t-h, --help - show this help\n\n"
  printf "\tcheck the script to understand how it functions\n"
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      _f_usage
      shift
      shift
      ;;
    -*|--**)
      printf "Unknown option: %s\n" "$1"
      _f_usage
      exit 1
      ;;
    *)
      _main_class="$1"
      shift
      break
  esac
done

if [[ -z "$_main_class" ]]; then
  printf "Class name not specified\n"
  _f_usage
  exit 1
fi

# Compile all java files in current directory
# It will pull the system defined CLASSPATH variable which contains a path to
# svetovid library
javac *.java

# Run the specified class with the system defined CLASSPATH variable with
# appended current directory. Also, rest of the arguments are passed to the
# program itself.
java --class-path $CLASSPATH:. $_main_class $*
