#!/bin/sh

# Because we cant interpolate environment variables in YAML,
#   this script lets us use a template to let us choose the runtime
#   for OpenWhisk at...runtime
# https://github.com/docker/compose/issues/495#issuecomment-126551019

# Vars
run_time_token="{{ run_time }}" # find this token
run_time=$RUNTIME

echo ${run_time_token} = ${run_time}

# Find and replace
sed -e "s/${run_time_token}/${run_time}/g" \
    < manifest-template.yaml \
    > manifest.yaml
