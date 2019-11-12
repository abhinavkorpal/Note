# how to grep docker log

docker logs nginx 2>&1 | grep "127." 

# ref: http://stackoverflow.com/questions/34724980/finding-a-string-in-docker-logs-of-container
