#!/bin/bash

LOG_FILE="debloat_log.txt"

debloat() {
  echo "Debloating Started, Don't Unplug Your Device"
  sleep 2
  echo "Be Patient..."
  > "$LOG_FILE"  # Clear the log file

  while IFS= read -r package; do
    echo "Removing package: $package"
    adb shell pm uninstall -k --user 0 "$package" >> "$LOG_FILE" 2>&1
    if [ $? -eq 0 ]; then
      echo "Package $package removed." | tee -a "$LOG_FILE"
    else
      echo "Package $package not found or removal failed." | tee -a "$LOG_FILE"
    fi
  done < app-list.txt

  echo "Debloating Completed."
}

rollback() {
  echo "Rollback Started, Don't Unplug Your Device"
  # spinner here
  > "$LOG_FILE"  # Clear the log file

  while IFS= read -r package; do
    echo "Rolling back package: $package"
    adb shell pm install-existing "$package" >> "$LOG_FILE" 2>&1
    if [ $? -eq 0 ]; then
      echo "Package $package rolled back." | tee -a "$LOG_FILE"
    else
      echo "Rollback of package $package failed." | tee -a "$LOG_FILE"
    fi
  done < app-list.txt

  echo "Rollback Completed."
}

insertnewapp() {
  echo "Enter Application Package Name"
  read -r appname
  echo "$appname" >> app-list.txt
}

echo "Checking For Connected Devices"
sleep 2
adb devices

echo -ne "
What do you want to do...?
1) Debloat Device
2) Rollback Changes
3) Insert New App To Debloat List
"
read -r option

if [ "$option" == 1 ]; then
  debloat
elif [ "$option" == 2 ]; then
  rollback
else
  insertnewapp
fi

