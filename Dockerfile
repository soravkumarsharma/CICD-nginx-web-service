FROM nginx:latest
MAINTAINER Sorav Kumar Sharma <add.sorav@gmail.com>
WORKDIR /usr/share/nginx/html
CMD ["rm", "-rf", "index.html"]
COPY finexo-html/  .
EXPOSE 80
