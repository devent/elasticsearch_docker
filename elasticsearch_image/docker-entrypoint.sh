#!/bin/bash
set -eo pipefail

# Add local user;
# Either use the 
# - ELASTICSEARCH_USER_ID and
# - ELASTICSEARCH_GROUP_ID
# if passed in at runtime or fallback.
USER_ID=${ELASTICSEARCH_USER_ID:-9001}
GROUP_ID=${ELASTICSEARCH_GROUP_ID:-9001}
echo "Starting with UID and GID: $USER_ID:$GROUP_ID"
usermod -u $USER_ID elasticsearch
groupmod -g $GROUP_ID elasticsearch

# update permissions
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

# run parent's entrypoint script
/elasticsearch-docker-entrypoint.sh "$@"
