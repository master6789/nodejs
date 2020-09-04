# use a node base image
FROM node:12.4.0-alpine as debug
WORKDIR /usr/src/app
COPY ./package.json /usr/src/app/package.json
RUN npm install
RUN npm install -g nodemon
copy /usr/src/app /var/snap/docker/common/var-lib-docker/tmp/docker-builder775995490/src
ENTRYPOINT ["nodemon","--inspect=0.0.0.0","./src/server.js"]

FROM node:12.4.0-alpine as prod
WORKDIR /usr/src/app
COPY ./package.json /usr/src/app/package.json
RUN npm install
RUN npm install -g nodemon
copy /usr/src/app /var/snap/docker/common/var-lib-docker/tmp/docker-builder775995490/src
EXPOSE 8000
CMD node.

