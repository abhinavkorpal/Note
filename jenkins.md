For Mac

You might be able to use launchctl for starting and stopping Jenkins.

Start
```shell
sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist
```
Stop
```shell
sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist
```
