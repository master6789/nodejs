# use a node base image
FROM node:12.4.0-alpine as debug
WORKDIR /work/
COPY ./src/package.json /work/package.json
RUN npm install
RUN npm install -g nodemon
copy ./src/ /work/src/
ENTRYPOINT ["nodemon","--inspect=0.0.0.0","./src/server.js"]

FROM node:12.4.0-alpine as prod
WORKDIR /work/
COPY ./src/package.json /work/package.json
RUN npm install
copy ./src/ /work/src/
EXPOSE 8000
CMD node.

