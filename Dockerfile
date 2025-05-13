# Use the official nginx image
FROM nginx:stable-alpine

#If WORKDIR is not specified then it is root(/) by default

# Copy static website files into the nginx web directory
COPY ./build/web /usr/share/nginx/html

# nginx listens to port 80 by default not neccessary to write
#EXPOSE 80


