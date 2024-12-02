#!/bin/sh
# Set the CLASSPATH environment variable
export CLASSPATH=".:/home/pravi/ZebraTester/Container/xercesImpl-2.11.0.jar:/home/pravi/ZebraTester/Container/lib/*"

# Run the Java program with the specified memory option and parameters
java -Xmx768m Platform_Prod_US_v2 -u 1 -d 90 -t 60 -sdelay 200 -maxloops 1 -sampling 15 -percpage 100 -percurl 20 -maxerrmem 20 -nolog