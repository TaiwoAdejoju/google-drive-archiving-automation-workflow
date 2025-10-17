# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Set the user to root to allow installation of packages if needed
USER root

# Install any additional dependencies if required (uncomment and modify as needed)
# RUN apk add --no-cache curl

# Create a directory for workflows
RUN mkdir -p /home/node/.n8n/workflows

# Copy the workflow file into the container
COPY "Google Drive Aechive Old Files.json" /home/node/.n8n/workflows/

# Switch back to the n8n user
USER node

# Expose the default n8n port
EXPOSE 5678

# Set environment variables (adjust as needed)
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=goodness2018

# Start n8n
CMD ["n8n"]