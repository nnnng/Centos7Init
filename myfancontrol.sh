#!/bin/bash
#arr_levelX=(风扇级别 起始温度 结束温度)
arr_level0=(0 0 58000)
arr_level_auto=('auto' 58000 32767000)
#arr_levels=($arr_level0 $arr_level_auto)
arr_levels=(0 0 55000 1 50000 62000  2 58000 70000  'auto' 68000 32767000)
curActive=0
cumulative=0

#set -e
function resetFan {
    echo "resetFan"
    echo "level auto" > /proc/acpi/ibm/fan
    exit
}
# 确保程序退出后,回复auto状态
trap resetFan EXIT
#trap resetFan ERR

while [ 1 -eq 1 ]
do
    curTmp=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input)
    echo "curTemp:" $curTmp

    arr_curLevel=(${arr_levels[$curActive]} ${arr_levels[$curActive+1]} ${arr_levels[$curActive+2]})
    
    if [ ${arr_curLevel[1]} -le $curTmp ] && [ ${arr_curLevel[2]} -ge $curTmp ];
    then
        echo "level: " $curActive;
        let cumulative++;
        if [ $cumulative -gt 5 ];
        then
            #echo "level "${arr_curLevel[0]};
            echo "level "${arr_curLevel[0]} > /proc/acpi/ibm/fan  ;
        fi
        sleep 2;
    elif [ ${arr_curLevel[1]} -gt $curTmp ];
    then
        let curActive-=3;
	let cumulative=0;
    else
        let curActive+=3;
	let cumulative=0;
    fi
    #sleep 10
done

# echo level something > /proc/acpi/ibm/fan

