FROM nginx

COPY build/html/ /usr/share/nginx/html/

RUN ls -lotr /usr/share/nginx/html/
