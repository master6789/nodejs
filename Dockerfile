# use a node base image
FROM node:7-onbuild
WORKDIR /usr/src/app/
COPY requirements.txt ./
COPY . .
VOLUME /usr/src/app/

# set maintainer
LABEL maintainer "traitor6789@gmail.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000

