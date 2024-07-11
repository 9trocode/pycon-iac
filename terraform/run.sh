#!/bin/bash

# Determine the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change directory to the script's directory
cd "$SCRIPT_DIR" || exit

# Create the states directory if it doesn't exist
if [ ! -d "states" ]; then
    echo -e "${GREEN}📁 Creating states directory...${NC}"
    mkdir states
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}${SUCCESS_EMOJI} states directory created successfully.${NC}"
    else
        echo -e "${RED}${ERROR_EMOJI} Failed to create states directory.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}📁 states directory already exists.${NC}"
fi

# Load nvm if it's not already loaded
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Use the desired Node.js version (optional, if specified in your project)
nvm use 20

# Optionally, you can add additional commands as needed:
cdktf synth   # Synthesize Terraform configuration without deploying

# CDKTerraform deploy command
cdktf deploy --auto-approve

# Exit with the status of the last executed command
exit $?
