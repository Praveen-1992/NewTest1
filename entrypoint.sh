#!/bin/sh

# Run the ProxySniffer Java program in the background with specified memory settings
java -Xmx768m ProxySniffer -JobControlTler -ExecAgent -encryptJobsOriginBackup -tz CS &

# Debugging: Show the arguments being passed to exec
echo "Arguments passed: $@"

# Forward all arguments to the main command if valid (add validation if needed)
exec "$@"
