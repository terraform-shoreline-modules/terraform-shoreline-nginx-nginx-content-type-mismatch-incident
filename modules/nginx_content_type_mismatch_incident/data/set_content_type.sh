

#!/bin/bash



# Set the correct Content-Type header for web resources in the server configuration file



CONFIG_FILE=${PATH_TO_SERVER_CONFIGURATION_FILE}

content_type=${CORRECT_CONTENT_TYPE}



# Check if the configuration file exists

if [ ! -f "$CONFIG_FILE" ]; then

  echo "ERROR: Configuration file not found: $CONFIG_FILE"

  exit 1

fi



# Create a backup for the configuration file

cp $CONFIG_FILE $CONFIG_FILE.bak



# Update the configuration file

sed -i "s/^#*\(add_header Content-Type.*\)/add_header Content-Type \"$content_type\";/" "$CONFIG_FILE"



# Restart the server

systemctl restart nginx



echo "Server configuration updated successfully"