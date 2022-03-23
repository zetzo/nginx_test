FROM nginx:1.21.6-alpine

## settings
COPY nexus.conf /etc/nginx/conf.d/
COPY portainer.conf /etc/nginx/conf.d/

## certs
COPY c_portainer.pem /etc/nginx/ssl/
COPY k_portainer.pem /etc/nginx/ssl/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*


## From result stage copy over the artifacts in dist folder to default nginx public folder
## COPY --from=result /usr/src/app/site /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]