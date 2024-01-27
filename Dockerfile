# Use a minimal web server image as the base image
FROM nginx:alpine

# Remove the default NGINX welcome page
RUN rm -rf /usr/share/nginx/html/*

# Install Git and clone the repository
RUN apk update && \
    apk add git && \
    git clone https://github.com/GAYATHRI24042003/CALCULATOR-.git /usr/share/nginx/html/ && \
    rm -rf /usr/share/nginx/html/.git

# Expose port 80
EXPOSE 80

# Update NGINX configuration to use /usr/share/nginx/html as the web root and set an index file
RUN sed -i 's:/usr/share/nginx/html:/usr/share/nginx/html/:g' /etc/nginx/conf.d/default.conf

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]