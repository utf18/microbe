# microbe

the sole purpose of this repo is a demo/example golang webserver running inside a docker container.  
It will return *service is working correctly* and a http statuscode of *200* as long everything works.

run it:  
`docker run --rm --name microbe -d -p 8080:8080 benst/ microbe:1.0`

test it:  
`curl localhost:8080`

stop it:  
`docker stop microbe`
