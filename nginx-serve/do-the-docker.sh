docker rm -f little-dark-secret && \
docker run -d --name little-dark-secret \
    -p 8001:8080 --restart always \
    --mount type=bind,source="$(pwd)"/dist,target=/usr/share/nginx/html \
    --mount type=bind,source="$(pwd)"/nginx.conf,target=/etc/nginx/nginx.conf \
    nginxinc/nginx-unprivileged:alpine
