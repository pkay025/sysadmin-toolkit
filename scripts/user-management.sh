#!/bin/bash

echo "User Management Toolkit"
echo "======================="

while true; do
    echo
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Lock User"
    echo "4. Unlock User"
    echo "5. Check User Information"
    echo "6. Exit"

    read -p "Choose an option: " choice

    case "$choice" in

        1)
            echo
            echo "Create User"

            read -p "Enter username: " username

            if id "$username" &>/dev/null; then
                echo "User '$username' already exists."
            else
                if sudo useradd -m "$username"; then
                    echo "User '$username' created successfully."
                    sudo passwd "$username"
                else
                    echo "Failed to create user '$username'."
                fi
            fi
            ;;

        2)
            echo
            echo "Delete User"

            read -p "Enter username to delete: " delete_user

            if id "$delete_user" &>/dev/null; then
                if sudo userdel -r "$delete_user"; then
                    echo "User '$delete_user' deleted successfully."
                else
                    echo "Failed to delete user '$delete_user'."
                fi
            else
                echo "User '$delete_user' does not exist."
            fi
            ;;

        3)
            echo
            echo "Lock User"

            read -p "Enter username to lock: " lock_user

            if id "$lock_user" &>/dev/null; then
                if sudo usermod -L "$lock_user"; then
                    echo "User '$lock_user' locked successfully."
                else
                    echo "Failed to lock user '$lock_user'."
                fi
            else
                echo "User '$lock_user' does not exist."
            fi
            ;;

        4)
            echo
            echo "Unlock User"

            read -p "Enter username to unlock: " unlock_user

            if id "$unlock_user" &>/dev/null; then
                if sudo usermod -U "$unlock_user"; then
                    echo "User '$unlock_user' unlocked successfully."
                else
                    echo "Failed to unlock user '$unlock_user'."
                fi
            else
                echo "User '$unlock_user' does not exist."
            fi
            ;;

        5)
            echo
            echo "Check User Information"

            read -p "Enter username to check: " check_user

            if id "$check_user" &>/dev/null; then
                echo
                echo "User Information"
                echo "-----------------"

                id "$check_user"

                echo
                echo "Home Directory:"
                getent passwd "$check_user" | cut -d: -f6

                echo
                echo "Login Shell:"
                getent passwd "$check_user" | cut -d: -f7

                echo
                echo "Groups:"
                groups "$check_user"
            else
                echo "User '$check_user' does not exist."
            fi
            ;;

        6)
            echo
            echo "Exiting User Management Toolkit..."
            exit 0
            ;;

        *)
            echo
            echo "Invalid option. Please choose 1-6."
            ;;
    esac
done
