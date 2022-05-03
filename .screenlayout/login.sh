dual=0

for item in $(xrandr -q | rg " connected" | awk '{ print $1 }')
do
	if [[ $item == "DP2" ]]; then
    	source $HOME/.screenlayout/dual-monitor.sh
        dual=1
    fi
done

if [[ $dual == 0 ]]; then
    source $HOME/.screenlayout/single-monitor.sh
fi
