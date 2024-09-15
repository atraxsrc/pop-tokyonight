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
        sudo nala upgrade
    elif command_exists apt-get; then
        sudo apt-get update && sudo apt-get upgrade
    else
        print_color "red" "No supported package manager found. Skipping system update."
        return 1
    fi
}

# Function to update Flatpak
update_flatpak() {
    if command_exists flatpak; then
        print_color "yellow" "Updating Flatpak applications..."
        flatpak update 2>/dev/null || print_color "red" "Flatpak update encountered an error, but continuing..."
    else
        print_color "yellow" "Flatpak not found. Skipping Flatpak update."
    fi
}

# Function to update Snap
update_snap() {
    if command_exists snap; then
        print_color "yellow" "Updating Snap packages..."
        sudo snap refresh
    else
        print_color "yellow" "Snap not found. Skipping Snap update."
    fi
}

# Main function
main() {
    print_color "green" "Starting system update..."

    update_system
    update_flatpak
    update_snap

    print_color "green" "System update completed successfully!"
}

# Run the main function
main
