#!/bin/bash

# This script captures network traffic on a specified network interface and saves it to a pcap file.
# It then attempts to open the pcap file in Wireshark for analysis.

# The network interface to capture traffic on.
interface="eth0"
# The number of packets to capture.
num_packets=10

# Check if the specified network interface exists.if [ -z "$(ip a show $interface)" ]; then
    # If the interface does not exist, print an error message and exit.
    echo "The network interface $interface does not exist. Exiting."
    exit 1
fi

# Print a message indicating the start of the packet capture.
echo "Capturing $num_packets packets of network traffic on interface $interface..."
# Attempt to capture the specified number of packets on the specified interface.
# The captured packets are saved to a pcap file.
if ! sudo tcpdump -i "$interface" -c "$num_packets" -w network_traffic.pcap; then
    # If the packet capture fails, print an error message and exit.
    echo "Failed to capture network traffic. Exiting."
    exit 1
fi
# Print a message indicating the successful capture of network traffic.
echo "Network traffic captured and saved to network_traffic.pcap."

# Check if Wireshark is installed.
if ! command -v wireshark &> /dev/null; then
    # If Wireshark is not installed, print an error message and exit.
    echo "Wireshark could not be found. Please install it and try again."
    exit 1
fi

# Print a message indicating the start of the Wireshark analysis.
echo "Launching Wireshark to analyze captured traffic..."
# Attempt to open the pcap file in Wireshark.
if ! wireshark network_traffic.pcap; then
    # If the pcap file cannot be opened in Wireshark, print an error message and exit.
    echo "Failed to open the pcap file in Wireshark. Exiting."
    exit 1
fi

# Print a message indicating the successful completion of the script.
echo "Done."