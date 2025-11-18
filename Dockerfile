# Gunakan nginx alpine untuk image yang lebih kecil
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Hapus default nginx static assets
RUN rm -rf ./*

# Copy file HTML, CSS, dan Images ke nginx directory
COPY index.html .
COPY wedding-custom.css .
COPY foto1.jpeg .

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
