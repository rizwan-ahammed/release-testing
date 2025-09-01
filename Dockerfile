FROM alpine:latest

# Install bash
RUN apk add --no-cache bash

# Create app directory
WORKDIR /app

# Copy startup script
COPY startup.sh /app/startup.sh
RUN chmod +x /app/startup.sh

# Set default command
CMD ["/bin/bash", "/app/startup.sh"]
