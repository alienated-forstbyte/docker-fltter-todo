# Use the official nginx image
FROM nginx:stable-alpine

# Copy static website files into the nginx web directory
COPY ./build/web /usr/share/nginx/html
