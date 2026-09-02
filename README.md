# Linux Log Analyzer

A Bash-based log analysis tool that analyzes Linux authentication logs to identify login activity, failed login attempts, and potentially suspicious IP addresses.

## Features

- Checks whether the specified log file exists
- Counts total log entries
- Counts failed login attempts
- Counts successful login attempts
- Identifies IP addresses associated with failed login attempts
- Ranks failed login attempts by IP address
- Provides a basic security status based on the number of failed login attempts

## Getting Started

**1. Clone the repository:**
```bash
git clone https://github.com/<your-username>/linux-log-analyzer.git
```
**2. Navigate into the project folder:**
```bash
cd linux-log-analyzer
```
**3. Make the script executable:**
```bash
chmod +x log.analyzer.sh
```
**4. Run the script:**  
```bash
./log.analyzer.sh
```
