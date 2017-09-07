FROM nginx:1.13.5

RUN rm /etc/nginx/nginx.conf && \
    rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/
COPY python.conf /etc/nginx/conf.d/
