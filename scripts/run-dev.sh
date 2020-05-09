#!/bin/bash

# Load envs
set -a
. ./.env
set +a

# Print envs
echo "##### VARIABLES ######"
cat .env | xargs -n1 echo
echo "#####    END    ######"

# Build and Run
mix compile --force && mix run --no-halt

