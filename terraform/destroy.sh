#!/bin/bash

# Determine the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change directory to the script's directory
cd "$SCRIPT_DIR" || exit

# Load nvm if it's not already loaded
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Use the desired Node.js version (optional, if specified in your project)
nvm use 20

# Optionally, you can add additional commands as needed:
cdktf synth   # Synthesize Terraform configuration without deploying

# CDKTerraform deploy command
cdktf destroy --auto-approve

# Exit with the status of the last executed command
exit $?
