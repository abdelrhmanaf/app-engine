FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/app_engine

COPY ./index.html /usr/share/nginx/www/

RUN mkdir -p /usr/share/nginx/www/_ah && \
    echo "healthy" > /usr/share/nginx/www/_ah/health

RUN chmod -R a+r /usr/share/nginx/www

CMD ["nginx", "-g", "daemon off;"]