#!/bin/sh
echo "Starting ZebraTester..."

# Start ProxySniffer in the background
java -Xmx768m ProxySniffer -JobControlTler -ExecAgent -encryptJobsOriginBackup -tz CS -execAgentHost ::1 -execAgentPort 7993 &

# Capture the PID of the background process
PROXY_SNIFFER_PID=$!

# Wait for a brief moment to ensure the background process starts successfully
sleep 2

# Check if the background process is still running
if ! ps -p $PROXY_SNIFFER_PID > /dev/null; then
  echo "Error: ProxySniffer failed to start."
  exit 1
fi

echo "ProxySniffer started with PID $PROXY_SNIFFER_PID."

# Forward all arguments to the main command
exec "$@"
