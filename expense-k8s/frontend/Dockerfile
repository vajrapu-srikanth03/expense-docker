FROM nginx:mainline-alpine3.20-slim

# Remove default config and create necessary directories
RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/cache/nginx/{client_temp,proxy_temp,fastcgi_temp,uwsgi_temp,scgi_temp} && \
    chown -R nginx:nginx /var/cache/nginx /etc/nginx /var/log/nginx && \
    chmod -R 755 /etc/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

# Copy custom configuration and application code
# COPY nginx.conf /etc/nginx/nginx.conf
COPY code /usr/share/nginx/html

# Switch to the nginx user
USER nginx