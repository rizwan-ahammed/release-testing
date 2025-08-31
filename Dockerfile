FROM busybox:latest

# Create app directory
WORKDIR /app

# Copy startup script
COPY startup.sh /app/startup.sh
RUN chmod +x /app/startup.sh

# Set default command
CMD ["/app/startup.sh"]
