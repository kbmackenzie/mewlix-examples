#!/bin/sh

SCRIPT_NAME='run-project'

log_message() {
  echo "[$SCRIPT_NAME] $1"
}

log_error() {
  echo "[$SCRIPT_NAME] $1" 1>&2
}

string_match() {
  echo "$2" | grep -Ee "$1" > /dev/null
}

is_number() {
  string_match "^[[:digit:]]+$" "$1"
}

if [ -z "$1" ]; then
  log_error 'No project number specified!'
  exit 1
fi

if ! is_number "$1"; then
  log_error "Invalid project number: \"$1\""
  exit 1
fi

PROJECT=$(find . -maxdepth 1 -type d -name "$1*" | head -n 1)

if [ -z "$PROJECT" ]; then
  log_error "No project found matching number $1!"
  exit 1
fi

log_message "Running project $1: \"$PROJECT\""

cd "$PROJECT" || {
  log_error "Couldn't cd into project directory \"$PROJECT'\""
  exit 1
}
mewlix run
