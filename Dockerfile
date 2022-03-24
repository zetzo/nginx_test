FROM nginx:1.21.6-alpine

## settings
COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/

## certs
COPY cicd.crt /etc/ssl/certs/
COPY cicd.pem /etc/ssl/private/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*


## From result stage copy over the artifacts in dist folder to default nginx public folder
## COPY --from=result /usr/src/app/site /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]