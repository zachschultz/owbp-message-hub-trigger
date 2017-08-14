# owbp-message-hub-trigger
Code from here: https://github.com/IBM/openwhisk-message-hub-trigger

## Building correct manifest YAML file
In order to let our `clone-and-wskdeploy` OW action choose the correct runtime at runtime, we have it run a shell script called `manifest_replace.sh`, which checks the environment variable for the runtime to use (`$RUNTIME`), and injects it into the `manifest-template.yaml` file to create the final `manifest.yaml` file, which `wskdeploy` will then use
