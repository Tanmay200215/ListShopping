#!/bin/bash
# validate.sh - Validates inputs

validate_item() {
    local item="$1"
    if [[ -z "$item" ]]; then
        echo "Item name cannot be empty!"
        return 1
    fi
    if grep -q "^$item$" shopping_list.txt; then
        echo "Item already exists!"
        return 1
    fi
    return 0
}
