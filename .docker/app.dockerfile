# https://docs.docker.com/engine/reference/builder/

# Start Redis
# docker run -d --name redis-data -v /redis-data:/data redis:5.0.8-alpine redis-server --appendonly yes
# docker run -d --name redis-scrumblr --volumes-from redis-data redis:5.0.8-alpine

# docker build -t gabema/scrumblr-app -f .docker\app.dockerfile .
# docker run -it --rm --name scrumblr --link redis-scrumblr:redis -p 8080:8080 gabema/scrumblr-app

FROM node:lts-alpine

LABEL maintainer="gabema@gmail.com"

ENV NODE_ENV=production

COPY . /var/www

WORKDIR /var/www

VOLUME [ "/var/www" ]

RUN npm install

EXPOSE 8080

ENTRYPOINT npm start
