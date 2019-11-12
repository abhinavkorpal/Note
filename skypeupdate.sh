#! /bin/bash
DEB_FILE=/tmp/skype.deb

# remove old file if any
rm $DEB_FILE
# get download link
if [ -z "$1" ]; then
	DOWNLOAD_LINK=https://go.skype.com/skypeforlinux-64.deb
else
	DOWNLOAD_LINK="$1"
fi

# Download latest skype deb
wget -O $DEB_FILE $DOWNLOAD_LINK

# check file
if [ -f "$DEB_FILE" ]; then

	# determine if skype is running
	IS_RUNNING=$(pgrep skype | wc -l)
	
	if [[ $IS_RUNNING -gt 0 ]]; then
		# remember user & close skype
                SKYPE_USER=$(ps -C skypeforlinux -o user= | head -1)
		killall -9 skypeforlinux
	fi

	# install new skype
	dpkg -i $DEB_FILE

	if [[ $IS_RUNNING -gt 0 ]]; then
		#start again
		sudo -u $SKYPE_USER skypeforlinux
	fi
else
	echo "Cannot download .deb file"
	exit 0
fi


# Download this file
# Make it executable sudo chmod +x /path/to/skypeupdate.sh
# Add this file to root cron sudo crontab -e
```shell
0 2 * * * /path/to/skypeupdate.sh
```
# cause dpkg command requires root priveleges.

# You can provide your own download link directly in cron without editing the script:
```shell
0 2 * * * /path/to/skypeupdate.sh https://another-download.link
0 2 * * * sets update at 2 a.m. Change it to suitable time.
```
