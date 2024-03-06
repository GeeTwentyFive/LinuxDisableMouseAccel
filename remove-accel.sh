#!/bin/sh

if !command -v xinput &> /dev/null
then

	echo "ERROR: xinput not found."
	exit 1

fi



IDs=($(xinput | grep 'pointer' | grep -o 'id=[0-9].' | grep -o '[0-9].'))

for i in "${IDs[@]}";
do

	$(xinput set-prop $i "libinput Accel Profile Enabled" 0 1 0 &> /dev/null)

done



echo "Mouse accel disabled."

