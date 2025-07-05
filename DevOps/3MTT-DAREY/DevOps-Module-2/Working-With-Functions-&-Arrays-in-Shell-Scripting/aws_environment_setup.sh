#!/bin/bash

# ========== FUNCTION DEFINITIONS ==========

# Check argument count
check_num_of_args() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        echo "Valid environments: local, testing, production"
        exit 1
    fi
}

# Activate environment configuration
activate_environment() {
    local env="$1"
    case "$env" in
        local)
            echo "[INFO] Configuring LOCAL environment..."
            export AWS_PROFILE="default"
            ;;
        testing)
            echo "[INFO] Configuring TESTING environment..."
            export AWS_PROFILE="testing"
            ;;
        production)
            echo "[INFO] Configuring PRODUCTION environment..."
            export AWS_PROFILE="production"
            ;;
        *)
            echo "[ERROR] Invalid environment '$env'"
            echo "Valid options: local, testing, production"
            exit 2
            ;;
    esac
}

# Verify AWS CLI installation
check_aws_cli() {
    if ! command -v aws >/dev/null 2>&1; then
        echo "[ERROR] AWS CLI not found. Please install it first."
        exit 3
    fi
}

# Check AWS profile configuration
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "[ERROR] AWS_PROFILE environment variable not set"
        exit 4
    fi

    if ! aws configure list-profiles | grep -qx "$AWS_PROFILE"; then
        echo "[ERROR] AWS profile '$AWS_PROFILE' is not configured"
        exit 5
    fi
}

# ========== MAIN EXECUTION ==========

check_num_of_args "$@"
activate_environment "$1"
check_aws_cli
check_aws_profile

echo "[SUCCESS] AWS environment '$1' configured properly."
aws configure list
