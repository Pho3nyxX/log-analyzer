#!/bin/bash

LOG_FILE="./logs/sample-auth.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file does not exist."
    exit 1
fi

TOTAL_ENTRIES=$(wc -l < "$LOG_FILE")
FAILED_LOGINS=$(grep -c "Failed password" "$LOG_FILE")
SUCCESSFUL_LOGINS=$(grep -c "Accepted password" "$LOG_FILE")

show_summary() {

    echo
    echo "----------------------------------------"
    echo "LOG SUMMARY"
    echo "----------------------------------------"

    echo "Total Log Entries:     $TOTAL_ENTRIES"
    echo "Failed Login Attempts: $FAILED_LOGINS"
    echo "Successful Logins:     $SUCCESSFUL_LOGINS"
}

show_failed_ips() {

    echo
    echo "----------------------------------------"
    echo "FAILED LOGIN ATTEMPTS BY IP"
    echo "----------------------------------------"

    grep "Failed password" "$LOG_FILE" |
    grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' |
    sort |
    uniq -c |
    sort -nr
}

check_security_status() {

    echo
    echo "----------------------------------------"
    echo "SECURITY STATUS"
    echo "----------------------------------------"

    if [ "$FAILED_LOGINS" -ge 10 ]; then
        echo "Status: WARNING"
        echo "Multiple failed login attempts detected."
    else
        echo "Status: NORMAL"
    fi
}

echo "========================================"
echo "          LINUX LOG ANALYZER"
echo "========================================"

echo
echo "Log File: $LOG_FILE"

show_summary
show_failed_ips
check_security_status