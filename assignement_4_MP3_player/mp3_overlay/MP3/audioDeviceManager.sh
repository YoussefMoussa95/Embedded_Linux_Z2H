#!/bin/sh
#This script is called in the background to check for audio output devices

#Call Bluetooth initialization script
sh /MP3/startBluetooth.sh
sleep 20

#Continuously check for new audio devices, with priority Bluetooth --> HDMI --> Audio jack
while :
do
    
    sleep 2
    bluetooth_flag=`bluetoothctl info D0:8A:55:5C:DC:14 | grep "Connected:\ yes"`
    hdmi_flag=`tvservice -n | grep -c "Crusher Wireless"`

    #Check if Bluetooth is connected
    if [ $bluetooth_flag -ne 0 ]; then
      amixer cset numid=3 1 

    #  amixer cset numid=3 2

    #Audio jack is default
    else
      amixer cset numid=3 1

    fi

    #TODO: if no device is plugged, pause the song
    #TODO: when device is changed, inform user via espeak

done
