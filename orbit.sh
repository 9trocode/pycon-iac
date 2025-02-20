#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Emojis
SUCCESS_EMOJI="✅"
ERROR_EMOJI="❌"

# Function to execute a script with logging and emoji
run_script() {
    script_name=$1
    emoji=$2
    log_message=$3

    echo -e "${GREEN}${emoji} Running ${script_name}...${NC}"
    echo -e "${log_message}"
    chmod +x "./${script_name}"  # Ensure script has execute permissions
    "./${script_name}"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}${emoji} ${script_name} completed successfully.${NC}"
    else
        echo -e "${RED}${ERROR_EMOJI} ${script_name} failed.${NC}"
        exit 1
    fi
}

# PipeOps Orbit branding
echo -e "${GREEN}🚀🚀 Welcome to PipeOps Orbit 🚀🚀${NC}"

# Run Terraform script
run_script "terraform/run.sh" "🚀" "Deploying CDKTF application with PipeOps Orbit..."

# Run AWS CDK script
run_script "aws/run.sh" "🚀" "Deploying AWS CDK application with PipeOps Orbit..."

# Run Pulumi script
run_script "pulumi/run.sh" "🚀" "Deploying Pulumi application with PipeOps Orbit..."

# Additional actions or cleanup if needed
echo -e "${GREEN}${SUCCESS_EMOJI} All operations completed with PipeOps Orbit.${NC}"
