#!/bin/bash

# System Functions Script

# Function Definitions

show_date() {
    clear
    echo -e "Today's date is: \c"
    date
    echo -e "\n\nPress Enter to return to the main menu."
    read
}

show_users() {
    clear
    echo -e "\nThe people logged into the system include:"
    who
    echo -e "\n\nPress Enter to return to the main menu."
    read
}

show_root_contents() {
    clear
    echo -e "\nThe contents of the / directory are:"
    ls -F /
    echo -e "\n\nPress Enter to return to the main menu."
    read
}

network_test() {
    clear
    echo -e "Preparing to run 3-Phase Network Test:"
    echo -e "Phase 1: Loopback Ping\nPhase 2: Basic Network Test\nPhase 3: DNS Test"
    echo -e "\nPress \e[31m^C\e[0m at any time to stop the test.\n"
    sleep 2

    # Phase 1: Loopback Ping Test
    echo -e "\n--- Phase 1: Loopback Ping ---"
    if ! ping -c 5 127.0.0.1 > /dev/null; then
        echo -e "\e[31mPhase 1 failed. Unable to ping localhost (127.0.0.1).\e[0m"
        echo -e "Common causes for this issue include:"
        echo -e "- Network interface misconfiguration\n- Issues with loopback interface\n- Firewall restrictions on local pings"
        echo -e "\nPress Enter to return to the main menu."
        read
        return
    fi
    echo -e "Phase 1 complete.\n"
    sleep 1

    # Phase 2: Basic Network Connectivity Test
    echo -e "\n--- Phase 2: Basic Network Connectivity ---"
    if ! ping -c 5 8.8.8.8 > /dev/null; then
        echo -e "\e[31mPhase 2 failed. Unable to reach external IP address (8.8.8.8).\e[0m"
        echo -e "Common causes for this issue include:"
        echo -e "- Issues with your router or local network\n- ISP service disruptions\n- Network cable or wireless issues"
        echo -e "\nPress Enter to return to the main menu."
        read
        return
    fi
    echo -e "Phase 2 complete.\n"
    sleep 1

    # Phase 3: DNS Resolution Test
    echo -e "\n--- Phase 3: DNS Resolution ---"
    if ! ping -c 5 google.com > /dev/null; then
        echo -e "\e[31mPhase 3 failed. Unable to resolve DNS (google.com).\e[0m"
        echo -e "Common causes for this issue include:"
        echo -e "- DNS server issues\n- Incorrect DNS settings in your network configuration\n- Problems with ISP-provided DNS"
        echo -e "\nPress Enter to return to the main menu."
        read
        return
    fi
    echo -e "Phase 3 complete.\n"
    sleep 1

    echo -e "\nNetwork test completed successfully!"
    echo -e "\nPress Enter to return to the main menu."
    read
}

exit_script() {
    clear
    echo -e "\e[32mGoodbye! Hasta la vista, Baby!\e[0m"
    sleep 2
    clear
    exit 0
}

# Main Menu Loop
while true; do
    clear
    echo -e "System Functions Menu\n"
    echo -e "1) Show Today's Date"
    echo -e "2) Show Currently Logged In Users"
    echo -e "3) Show Contents of Root Directory"
    echo -e "4) Run Network Test"
    echo -e "5) Exit Script"
    echo -ne "\nEnter your choice (1/2/3/4/5): "

    read -r ANSWER
    case "${ANSWER,,}" in
        1 | "d")
            show_date
            ;;
        2 | "u")
            show_users
            ;;
        3 | "r")
            show_root_contents
            ;;
        4 | "n")
            network_test
            ;;
        5 | "x")
            exit_script
            ;;
        *)
            echo -e "\e[31mInvalid choice: '$ANSWER'. Please try again.\e[0m"
            sleep 2
            ;;
    esac
done
