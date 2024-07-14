#!/bin/bash

# Show OS version
echo "OS Version:"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$NAME $VERSION"
else
    echo "OS version information not found!"
fi
echo ""

# List all users with bash shell
echo "Users with Bash Shell:"
grep '/bin/bash' /etc/passwd | cut -d: -f1
echo ""

# Show open ports
echo "Open Ports:"
sudo netstat -tuln | grep LISTEN
echo ""

# Save the script to a file
SCRIPT_NAME="system_info.sh"
cat << 'EOF' > $SCRIPT_NAME
#!/bin/bash

# Show OS version
echo "OS Version:"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$NAME $VERSION"
else
    echo "OS version information not found!"
fi
echo ""

# List all users with bash shell
echo "Users with Bash Shell:"
grep '/bin/bash' /etc/passwd | cut -d: -f1
echo ""

# Show open ports
echo "Open Ports:"
sudo netstat -tuln | grep LISTEN
echo ""
EOF