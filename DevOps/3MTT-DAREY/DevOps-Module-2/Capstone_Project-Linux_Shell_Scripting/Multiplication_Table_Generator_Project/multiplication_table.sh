#!/bin/bash

# ========== COLOR SETUP ==========
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ========== FUNCTION DEFINITIONS ==========

# Validate if input is a number
validate_number() {
    if ! [[ "$1" =~ ^[0-9]{1,3}$ ]]; then
        echo -e "${RED}Error: '$1' is not a valid number between 0-999.${NC}"
        return 1
    fi
}

# Validate if range is within 1–10 and start <= end
validate_range() {
    if ! [[ "$1" =~ ^[1-9]$|10$ ]] || ! [[ "$2" =~ ^[1-9]$|10$ ]]; then
        echo -e "${RED}Error: Range values must be integers between 1 and 10.${NC}"
        return 1
    fi

    if (( $1 > $2 )); then
        echo -e "${RED}Error: Start value ($1) must not be greater than end value ($2).${NC}"
        return 1
    fi
}

# Generate multiplication table
generate_table() {
    local num="$1"
    local start="$2"
    local end="$3"
    local style="$4"

    echo -e "\n${YELLOW}Multiplication Table (${style} format):${NC}"

    for (( i=start; i<=end; i++ )); do
        printf "%3d x %2d = %4d\n" "$num" "$i" $(( num * i ))
    done
}

# Ask a yes/no question
ask_yes_no() {
    local prompt="$1"
    while true; do
        read -rp "$prompt (y/n): " yn
        case "$yn" in
            [Yy]) return 0 ;;
            [Nn]) return 1 ;;
            *) echo -e "${RED}Please enter 'y' or 'n'.${NC}" ;;
        esac
    done
}

# ========== MAIN LOOP ==========

while true; do
    clear
    echo -e "${GREEN}=== Multiplication Table Generator ===${NC}\n"

    # Input: Number
    while true; do
        read -rp "Enter a number (0–999): " number
        validate_number "$number" && break
    done

    # Input: Range type
    echo -e "\n${YELLOW}Select multiplication range:${NC}"
    echo "1) Full Table (1–10)"
    echo "2) Custom Range"
    echo "3) Quit"

    while true; do
        read -rp "Enter choice [1-3]: " choice
        case "$choice" in
            1)
                start=1; end=10
                break
                ;;
            2)
                while true; do
                    read -rp "Enter start (1–10): " start
                    read -rp "Enter end ($start–10): " end
                    validate_range "$start" "$end" && break
                done
                break
                ;;
            3)
                echo -e "${GREEN}Goodbye!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please choose 1, 2, or 3.${NC}"
                ;;
        esac
    done

    # Output: Tables
    generate_table "$number" "$start" "$end" "list"
    generate_table "$number" "$start" "$end" "cstyle"

    # Ask to repeat
    echo
    if ! ask_yes_no "Would you like to generate another table?"; then
        echo -e "\n${GREEN}Program completed. Goodbye!${NC}"
        break
    fi
done

