FROM nginx:latest
WORKDIR /usr/share/nginx/html/
RUN rm -rf*
COPY finexo-html/  .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
