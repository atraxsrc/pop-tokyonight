#!/bin/bash

# Exit on error, but don't exit on pipefail
set -eo pipefail

# Function to print colored output
print_color() {
    case $1 in
        "green") echo -e "\033[0;32m$2\033[0m" ;;
        "red") echo -e "\033[0;31m$2\033[0m" ;;
        "yellow") echo -e "\033[0;33m$2\033[0m" ;;
    esac
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to update the system
update_system() {
    print_color "yellow" "Updating system packages..."
    
    if command_exists nala; then
        sudo nala update
        sudo nala upgrade -y
        sudo nala autoremove -y
        sudo nala clean
        print_color "green" "Nala system update complete"
    elif command_exists apt-get; then
        sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean
        print_color "green" "APT system update complete"
    else
        print_color "red" "No supported package manager found. Skipping system update."
        return 1
    fi
}

# Function to update Flatpak
update_flatpak() {
    if command_exists flatpak; then
        print_color "yellow" "Updating Flatpak apps..."
        if flatpak update -y; then
            print_color "green" "Flatpak update complete"
        else
            print_color "yellow" "Flatpak update completed (warnings for EOL runtimes are normal)"
        fi
    else
        print_color "yellow" "Flatpak not found. Skipping."
    fi
}

# Function to update Snap
update_snap() {
    if command_exists snap; then
        print_color "yellow" "Updating Snap packages..."
        local snap_output
        snap_output=$(sudo snap refresh 2>&1)
        if echo "$snap_output" | grep -q "All snaps up to date"; then
            print_color "green" "All snaps are up to date"
        else
            print_color "green" "Snap updates applied"
        fi
    else
        print_color "yellow" "Snap not found. Skipping."
    fi
}

# Main function
main() {
    print_color "green" "=== Starting system update ==="
    print_color "yellow" "Date: $(date)"
    echo
    
    if ! update_system; then
        print_color "red" "System update failed!"
        exit 1
    fi
    
    echo
    update_flatpak
    
    echo
    update_snap
    
    print_color "green" "=== System update completed ==="
}

# Run the main function
main "$@"
