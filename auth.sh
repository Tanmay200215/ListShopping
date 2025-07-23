#!/bin/bash
# auth.sh - Handles login and registration

USER_FILE="users.txt"

# Hash the password using sha256
hash_password() {
    echo -n "$1" | sha256sum | awk '{print $1}'
}

# Register a new user
register_user() {
    read -p "Enter new username: " username
    grep -q "^$username:" "$USER_FILE" && { echo "Username already exists!"; return 1; }

    read -sp "Enter new password: " password
    echo ""
    hashed_password=$(hash_password "$password")
    echo "$username:$hashed_password" >> "$USER_FILE"
    echo "User registered successfully."
}

# Login existing user
login_user() {
    read -p "Enter username: " username
    read -sp "Enter password: " password
    echo ""
    hashed_password=$(hash_password "$password")

    if grep -q "^$username:$hashed_password" "$USER_FILE"; then
        echo "$username"
        return 0
    else
        echo "Invalid username or password!"
        return 1
    fi
}
