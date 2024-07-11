#!/bin/bash

# Determine the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change directory to the script's directory
cd "$SCRIPT_DIR" || exit

# Set up environment variables (adjust as needed)
# export PULUMI_ACCESS_TOKEN=your-pulumi-access-token
export PULUMI_CONFIG_PASSPHRASE="pycon-pulumi"

# Pulumi commands
#pulumi login   # Log in to Pulumi
pulumi stack select dev   # Select the Pulumi stack
pulumi destroy --yes   # Destroy the Pulumi stack

# Unset environment variables (optional)
# unset PULUMI_ACCESS_TOKEN
unset PULUMI_CONFIG_PASSPHRASE
