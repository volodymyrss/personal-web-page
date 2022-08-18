FROM nginx

COPY build/html/ /usr/share/nginx/html/
COPY photos/build /usr/share/nginx/html/photos

RUN ls -lotr /usr/share/nginx/html/
