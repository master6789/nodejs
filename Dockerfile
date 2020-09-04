# use a node base image
FROM node:12.4.0-alpine as debug
WORKDIR /usr/src/app
COPY ./package.json /usr/src/app/package.json
RUN npm install
RUN npm install -g nodemon
copy ./src/ /usr/src/app
ENTRYPOINT ["nodemon","--inspect=0.0.0.0","./src/server.js"]

FROM node:12.4.0-alpine as prod
WORKDIR /usr/src/app
COPY ./package.json /usr/src/app/package.json
RUN npm install
RUN npm install -g nodemon
copy ./src/ /usr/src/app
EXPOSE 8000
CMD node.

