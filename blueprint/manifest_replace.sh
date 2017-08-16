#!/bin/sh

# Because we cant interpolate environment variables in YAML,
#   this script lets us use a template to let us choose the runtime
#   for OpenWhisk at...runtime
# https://github.com/docker/compose/issues/495#issuecomment-126551019

# Vars
runtime_token="{{ runtime }}" # find this token
runtime=$RUNTIME
runtime_extension_token="{{ runtime_extension }}"
case "${runtime}" in
  "python") runtime_extension="py"
  ;;
  "swift") runtime_extension="swift"
  ;;
  "php") runtime_extension="php"
  ;;
  "node") runtime_extension="js"
  ;;
esac

echo ${runtime_token} = ${runtime}
echo ${runtime_extension_token} = ${runtime_extension}
echo "RUNNING LS FOR TEST"
ls

# Find and replace
sed -e "s/${runtime_token}/${runtime}/g" \
    -e "s/${runtime_extension_token}/${runtime_extension}/g" \
    < manifest-template.yaml \
    > manifest.yaml
