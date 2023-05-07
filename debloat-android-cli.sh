#!/bin/bash
debloat(){
  echo "Debloating Started, Don't Unplug Your Device"
  sleep 2
  echo "Be Patient..."
  $packages cat app-list.txt
  adb shell pm uninstall -k --user 0 $(head -n 1 $packages)
}
rollback(){
  echo "Rollback Started, Don't Unplug Your Device"
 #spinner here
  $packages cat app-list.txt
  adb shell pm install-existing $(head -n 1 $packages)
}
insertnewapp(){
  echo "Enter Application Package Name"
  read appname
  echo $appname > app-list.txt
}
echo "Checking For Connected Devices"
sleep 2
  adb devices 
 echo -ne "
 What you want to do...?
 1) Debloat Device
 2) Rollback Changes 
 3) Insert New App To Debloat List
" 
read option
if [ $option == 1 ]; then 
  debloat
else
  if [ $option == 2 ]
 rollback 
else 
  insertnewapp
fi
fi 
