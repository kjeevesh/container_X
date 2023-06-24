FROM ubuntu:22.04

RUN mkdir -p /tmp/app

COPY sap-itsm-dev /tmp/app

# Update and install required dependencies

RUN apt-get update && \
    apt-get install -y curl gnupg

RUN apt-get install -y python3 python3-pip

# Install Node.js and npm
# RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

# Install Elasticsearch
RUN curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

# Install Elasticsearch and Kibana
RUN apt-get update && apt-get install -y elasticsearch-oss kibana-oss

# Install additional dependencies
RUN apt-get install -y nginx

# Install additional Node.js packages
# RUN npm install -g axios swagger-ui-express express

RUN pip3 install flask

RUN pip3 install pymongo pandas requests openpyxl ruamel.yaml flask apscheduler

# Expose ports
EXPOSE 9200 5601 5000

# Start Elasticsearch and Kibana services
ENTRYPOINT service elasticsearch start && service kibana start && tail -f /dev/null
