validate_number() {
    [[ "$1" =~ ^[0-9]+$ ]] || {
        echo -e "${RED}Error: Not a valid number${NC}"
        return 1
    }
}
