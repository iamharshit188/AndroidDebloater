# Android Debloater-Cli
### Disclaimer:Use at your own risk. I am not responsible fo anything that could happen to your phone.
This is a minimal command line based script to remove the system application/bloatwares.
This software aims to improve privacy and battery performance by removing unnecessary and obscure system apps.

## Is this safe..?

There is no binary answer, if the system application is necessary for working of android os and if you removing them,
It may make the device stuck on boot loop and you may need to flash the Stock Rom again.
 

## Features

> Uninstall and Restore system packages<br>
> Uninstall user packages<br>
> Removes Application for single user.<br>

## How to use it...

### Enable usb debugging
![image](https://user-images.githubusercontent.com/103060398/225995363-71625bee-c0ed-4cb1-be71-7d566747129e.png)<br>
![image](https://user-images.githubusercontent.com/103060398/225995783-76e50f7f-cde9-43f0-a80d-e4a7234231ae.png)<br>
> To remove more packages add package name to < app-list.txt > , (Package name not application name)
### Install Adb on you system<br>
*Ubuntu*<br>
 `sudo apt install android-sdk-platform-tools` <br>
 *Arch*<br>
 `sudo pacman -S android-sdk-platform-tools` <br>
 *RedHat*<br>
 `sudo yum install android-tools`<br>
 *Windows*<br>
 `We dont use Windows, Switch to linux first!`<br>
### Connect Device with USB<br>
### Run the script<br>
 `./debloat-android-cli.sh`<br>
 
 ## Adding More Applications to the list
  
 * The Package Name Can be found on /settings/apps&notifications/appinfo<br>
 
 ![image](https://user-images.githubusercontent.com/103060398/225998080-ba0b1c54-1dd1-42bd-a211-3f06c954374b.png)<br>
 
 To add new application you can select option 3 from the menu,
 Type the package name there
 

 ### Thanks.. :)
 < CHECKOUT SIMILAR PROJECT >
 https://github.com/0x192/universal-android-debloater
