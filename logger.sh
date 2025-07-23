login_user() {
    read -p "Enter username: " username
    read -sp "Enter password: " password
    echo ""
    hashed_password=$(hash_password "$password")

    if grep -q "^$username:$hashed_password" "$USER_FILE"; then
        USERNAME="$username"
        echo "Login successful! Welcome, $USERNAME."
        return 0
    else
        echo "Invalid username or password!"
        return 1
    fi
}
