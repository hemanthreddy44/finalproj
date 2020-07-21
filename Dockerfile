############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


FROM nginx
COPY index.html /usr/share/nginx/html
EXPOSE 80
