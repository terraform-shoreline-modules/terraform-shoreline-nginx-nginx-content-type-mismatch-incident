
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Nginx Content-Type Mismatch Incident
---

The Nginx Content-Type Mismatch Incident refers to a situation in which the Content-Type header mismatches, which can affect the rendering of content in web browsers. This incident can lead to unexpected rendering or display issues on websites or web applications. To prevent mismatches, it is important to ensure that the Content-Type header is correctly set for web resources.

### Parameters
```shell
export URL="PLACEHOLDER"

export PATH_TO_SERVER_CONFIGURATION_FILE="PLACEHOLDER"

export CORRECT_CONTENT_TYPE="PLACEHOLDER"
```

## Debug

### Check the Nginx configuration file for any misconfigurations
```shell
sudo nginx -t
```

### Check the response headers of a web resource to verify the Content-Type header
```shell
curl -I ${URL}
```

### Check the server logs for any errors related to the Content-Type header
```shell
sudo tail -f /var/log/nginx/access.log | grep 'content-type'
```

### Check the server logs for any errors related to the Nginx configuration
```shell
sudo tail -f /var/log/nginx/error.log | grep 'content-type'
```

### Check the Nginx version to ensure it is up-to-date
```shell
nginx -v
```

## Repair

### Update the server configuration: If the Content-Type header is not set correctly, update the server configuration to ensure that the header is set correctly for all web resources.
```shell


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
```