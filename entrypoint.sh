#!/bin/sh

# Run the ProxySniffer Java program in the background with specified memory settings
java -Xmx768m ProxySniffer -JobControlTler -ExecAgent -encryptJobsOriginBackup -tz CS &
