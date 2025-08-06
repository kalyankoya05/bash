#!/bin/bash

# check_service.sh
SERVICE="apache2"

if systemctl is-active --quiet "$SERVICE"; then
  echo "$(date '+%F %T') – $SERVICE is running."
else
  echo "$(date '+%F %T') – $SERVICE is NOT running. Attempting restart..."
  systemctl restart "$SERVICE"
  if systemctl is-active --quiet "$SERVICE"; then
    echo "$(date '+%F %T') – $SERVICE restarted successfully."
  else
    echo "$(date '+%F %T') – Failed to restart $SERVICE!"
  fi
fi
