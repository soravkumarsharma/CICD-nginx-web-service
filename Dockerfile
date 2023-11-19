FROM nginx:latest
MAINTAINER Sorav Kumar Sharma <add.sorav@gmail.com>
WORKDIR /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/*
COPY finexo-html/  .
RUN rm -rf 50x.html
EXPOSE 80
