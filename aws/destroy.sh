#!/bin/bash

# Determine the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change directory to the script's directory
cd "$SCRIPT_DIR" || exit

# Set up environment variables (adjust as needed)
#export CDK_DEFAULT_ACCOUNT=your-aws-account-id
export CDK_DEFAULT_REGION=us-west-1

# CDK commands
cdk bootstrap      # Boostrap CloudFormation templates
cdk synth      # Synthesize CloudFormation templates
cdk destroy --all --force   # Deploy all stacks

# Unset environment variables (optional)
unset CDK_DEFAULT_ACCOUNT
unset CDK_DEFAULT_REGION
