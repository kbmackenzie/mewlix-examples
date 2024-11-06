#!/bin/sh

SCRIPT_NAME='run-project'
HELP_MESSAGE=$(cat << EOM
Usage: run-project NUMBER [-h|--help] [-r|--rebuild] [-n|--no-run]

  Run an example project by number.

Available options:
  -h, --help        Display this help message
  -r, --rebuild     Re-build project before running.
  -n, --no-run      Build project, but don't run it. Implies --rebuild.
EOM
)

log_message() {
  echo "[$SCRIPT_NAME] $1"
}

log_error() {
  echo "[$SCRIPT_NAME] $1" 1>&2
}

help_message() {
  echo "$HELP_MESSAGE"
}

string_match() {
  echo "$2" | grep -Ee "$1" > /dev/null
}

is_number() {
  string_match "^[[:digit:]]+$" "$1"
}

LONG_OPTIONS='help,rebuild,no-run'
SHORT_OPTIONS='hrn'

OPTS=$(getopt -o "$SHORT_OPTIONS" -l "$LONG_OPTIONS" -n "$SCRIPT_NAME" -- "$@")
eval set -- "$OPTS"

REBUILD=false
NO_RUN=false

while true; do
  case "$1" in
    -h | --help)
      help_message
      exit 0 ;;
    -r | --rebuild)
      REBUILD=true
      shift ;;
    -n | --no-run)
      NO_RUN=true
      shift ;;
    --)
      shift
      break ;;
    * )
      break ;;
  esac
done


if [ $# -le 0 ]; then
  log_error 'No project number specified!'
  log_error 'Use the --help option for guidance.'
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

if [ "$NO_RUN" = 'true' ]; then
  # Implies --rebuild.
  mewlix build
elif [ "$REBUILD" = 'true' ]; then
  mewlix run -r
else
  mewlix run
fi
