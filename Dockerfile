FROM nginx

COPY build/html/ /usr/share/nginx/html/
COPY src/images/ /usr/share/nginx/html/images/
COPY src/files /usr/share/nginx/html/files/

RUN ls -lotr /usr/share/nginx/html/
