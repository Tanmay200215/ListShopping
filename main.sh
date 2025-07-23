#!/bin/bash
source auth.sh
source logger.sh
source validate.sh
source ui.sh

echo "---- Welcome to Shopping List App ----"
while true; do
    echo "1. Login"
    echo "2. Register"
    echo "3. Exit"
    read -p "Choose an option: " choice
    case $choice in
        1)
            login_user
            if [[ $? -eq 0 ]]; then
                log_action "User $USERNAME logged in"
                main_menu
            fi
            ;;
        2)
            register_user
            ;;
        3)
            echo "Goodbye!"
            exit
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
done
