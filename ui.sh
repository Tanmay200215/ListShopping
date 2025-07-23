#!/bin/bash
SHOPPING_FILE="shopping_list.txt"

add_item() {
    read -p "Enter item to add: " item
    validate_item "$item" || return
    echo "$item" >> "$SHOPPING_FILE"
    log_action "Item added: $item by $USERNAME"
    echo "Item '$item' added successfully."
}

view_list() {
    echo "---- Shopping List ----"
    if [[ ! -s "$SHOPPING_FILE" ]]; then
        echo "No items in the list."
    else
        cat "$SHOPPING_FILE"
    fi
}

remove_item() {
    read -p "Enter item to remove: " item
    grep -q "^$item$" "$SHOPPING_FILE" || { echo "Item not found!"; return; }
    grep -v "^$item$" "$SHOPPING_FILE" > temp.txt && mv temp.txt "$SHOPPING_FILE"
    log_action "Item removed: $item by $USERNAME"
    echo "Item '$item' removed successfully."
}

main_menu() {
    while true; do
        echo ""
        echo "---- Shopping List Menu ----"
        echo "1. Add item"
        echo "2. View list"
        echo "3. Remove item"
        echo "4. Exit"
        read -p "Choose an option: " option
        case $option in
            1) add_item ;;
            2) view_list ;;
            3) remove_item ;;
            4) log_action "User $USERNAME logged out"; exit ;;
            *) echo "Invalid option!" ;;
        esac
    done
}
