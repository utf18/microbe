# microbe

microbe will return *service is working correctly* and a http statuscode of *200* while the application is running.

run it:  
`docker run --rm --name microbe -d -p 8080:8080 benst/microbe:1.0`

test it:  
`curl localhost:8080`

stop it:  
`docker stop microbe`
