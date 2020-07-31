# tool-networking-test
A network troubleshooting tool that helps us to check the network issue.

Before compare, you need to check the IP of URL.

```sh
# Build the image
$ docker build -t networktest:0.0.2 .

# Run docker container to test
$ docker run -d --name=test networktest:0.0.2

# login container
$ sudo docker exec -it test sh

# stop the container
$ docker rm -f test

# remove image
$ docker rmi -f  networktest:0.0.2
```
