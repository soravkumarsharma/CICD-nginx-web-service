FROM nginx:latest
MAINTAINER Sorav Kumar Sharma <add.sorav@gmail.com>
WORKDIR /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/
COPY finexo-html/  .
EXPOSE 80
