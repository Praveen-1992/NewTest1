#!/bin/sh
echo "Running ZebraTester with arguments: $@"
java -Xmx1024m -classpath "$CLASSPATH" Platform_Prod_US_v2 "$@"
