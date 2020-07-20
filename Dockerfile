############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


FROM nginx
COPY frontend /usr/share/nginx/html
EXPOSE 80
