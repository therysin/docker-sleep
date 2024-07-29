An easy way to delay your docker services by a specified time. 
Minimal image based on busybox.

Example docker compose usage:

```
version: "3.8"

services:
  sleep:
    image: ghcr.io/therysin/docker-sleep/sleepy:latest
    container_name: sleepy
    environment:
      - delay=10 #delay time in seconds

  testcontainer:
    image: busybox:stable-musl
    container_name: test
    tty: true
    stdin_open: true
    depends_on:
      sleep:
        condition: service_completed_successfully
    command: sh -c "echo 'Test service is running' "
```
