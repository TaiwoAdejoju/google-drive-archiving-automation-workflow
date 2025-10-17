# Use the official n8n image as the base
FROM n8nio/n8n:latest

USER root

# Create a directory for workflows
RUN mkdir -p /home/node/.n8n/workflows

# Copy the workflow file into the container (no spaces in filename)
COPY workflows/Google_Drive_Archive_Old_Files.json /home/node/.n8n/workflows/

USER node

EXPOSE 5678

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=goodness2018

CMD ["n8n"]
