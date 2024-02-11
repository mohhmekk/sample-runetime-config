ARG DOCKER_ENV=local

FROM node:18-alpine AS builder
WORKDIR /project
COPY . .
RUN npm install && npm run build

FROM nginx:alpine as local_nginx
# Copy build
COPY --from=builder /project/build /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
# Copy env configs
COPY config ./config
COPY ./env-config.sh .
RUN chmod +x env-config.sh
# Copy nginx config
RUN rm -rf /etc/nginx/conf.d
COPY config/conf.d /etc/nginx/conf.d

FROM ${DOCKER_ENV}_nginx
RUN echo "Using config env: ${DEPLOYMENT_ENV}"
CMD ["/bin/sh", "-c", "/usr/share/nginx/html/env-config.sh && nginx -g \"daemon off;\""]