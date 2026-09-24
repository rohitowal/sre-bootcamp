#!/bin/bash

DOMAIN="$1"

echo "Domain: $DOMAIN" 
echo "----------------"

#Get DNS Server
DNS_SERVER=$(nslookup "$DOMAIN" | awk '/^Server:/{print $2}')

echo "DNS SERVER: $DNS_SERVER"

#Get A record
A_RECORD=$(nslookup -type=A "$DOMAIN" | awk '/^Address: / && $2 !~ /:/ {print $2}')

echo "A RECORD: $A_RECORD"

# Get MX record
MX_RECORD=$(nslookup -type=MX "$DOMAIN" | awk '/mail exchanger =/ {print $NF}')

echo "MX Record: $MX_RECORD"

# Get HTTP status code
HTTP_STATUS=$(curl -L -s -o /dev/null -w "%{http_code}" "https://$DOMAIN")

echo "HTTP Status: $HTTP_STATUS"
