sleep 1
source /data/adb/modules/RM8_Change_GameKey_Function/CGF_config
in_dev=$(cat /proc/bus/input/devices)
str1='gpio_keys_nubia/input/input'
index1=$(echo ${in_dev} | awk -F ${str1} '{print $1}' | wc -c)
in_dev_t2=${in_dev:index1:200}
str2='event'
index2=$(echo ${in_dev_t2} | awk -F ${str2} '{print $1}' | wc -c)
eventnum=${in_dev_t2:$(($index2-1)):6}
sub1()
{
nohup cat "/dev/input/"$eventnum > /data/adb/modules/RM8_Change_GameKey_Function/temp1.txt
}
`sub1`&

while
do
	sleep 0.5
	filesize=$(stat -c%s "/data/adb/modules/RM8_Change_GameKey_Function/temp1.txt")
	if [ "$filesize" -gt 0 ] 
	then
		filehex=$(/data/adb/magisk/busybox hexdump -s 16 -n 8 /data/adb/modules/RM8_Change_GameKey_Function/temp1.txt)
		filehex1=${filehex:8:9}
		filehex2=${filehex:21:1}
		if [ "$filehex1" == "0005 000f" ]
		then
			if [ "$filehex2" == "0" ]
			then
				#这里是按键下拨时要执行的内容
				if [ "$function_selection" -eq 1 ]
				then
					if [ "$vibrate_when_no_sound" -eq 1 ]
					then
						service call audio 35 i32 1 s16 RM8_CGF_mod
					fi
					if [ "$vibrate_when_no_sound" -eq 0 ]
					then
						service call audio 35 i32 0 s16 RM8_CGF_mod
					fi
					if [ "$media_also_no_sound" -eq 1 ]
					then
						service call audio 9 i32 3 i32 -100 i32 1
					fi
				fi
				if [ "$function_selection" -eq 2 ]
				then
					echo $flashlight_brightness > /sys/class/leds/led\:torch_0/brightness
					echo $flashlight_brightness > /sys/class/leds/led\:torch_3/brightness
					echo 1 > /sys/class/leds/led\:switch_2/brightness
				fi
				if [ "$function_selection" -eq 3 ]
				then
					/data/adb/modules/RM8_Change_GameKey_Function/user-owned_shell_up2down.sh
				fi
			fi
			if [ "$filehex2" == "1" ]
			then
				#这里是按键上拨时要执行的内容
				if [ "$function_selection" -eq 1 ]
				then
					service call audio 35 i32 2 s16 RM8_CGF_mod
					if [ "$media_also_no_sound" -eq 1 ]
					then
						service call audio 9 i32 3 i32 100 i32 1
					fi
				fi
				if [ "$function_selection" -eq 2 ]
				then
					echo 0 > /sys/class/leds/led\:switch_2/brightness
					echo 59 > /sys/class/leds/led\:torch_0/brightness
					echo 59 > /sys/class/leds/led\:torch_3/brightness
				fi
				if [ "$function_selection" -eq 3 ]
				then
					/data/adb/modules/RM8_Change_GameKey_Function/user-owned_shell_down2up.sh
				fi
			fi
		fi
		#jobs
		kill -9 %1
		rm /data/adb/modules/RM8_Change_GameKey_Function/temp1.txt
		touch /data/adb/modules/RM8_Change_GameKey_Function/temp1.txt
		`sub1`&
	fi
done
exit 0
