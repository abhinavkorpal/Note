# Test config and reload Apache in one command

function reload () {
	STATUS=$(sudo apache2ctl configtest 2>&1)
	OK=$(echo $STATUS | grep "OK" | wc -l)
	if [[ $OK -eq 1 ]]; then
		echo "reloading Apache..."
		sudo service apache2 reload
	else
		echo "$STATUS"
		LINEOF=$(echo "$STATUS" | grep -Eo "line ([0-9]+) of [^:]+")
		if [ ! -z "$LINEOF" ]; then
			POS=$(echo "$LINEOF" | cut -d' ' -f2)
			FILE=$(echo "$LINEOF" | cut -d' ' -f4)
			echo "Open $FILE:$POS to edit [y/n]?"
			read y
			if [[ "$y" == "y" ]]; then
				sudo vim +$POS $FILE
			fi
		fi
	fi
}

```shell
This function tests Apache config for errors and immediately reloads If none found, or requests if you want to edit specific line in your config file where problem was found.

Add this function to your ~/.bashrc file, relogin and type reload (I use vim and apache2)
```
