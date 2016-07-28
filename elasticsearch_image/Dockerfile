FROM elasticsearch:2.3.4
MAINTAINER Erwin Mueller "erwin.mueller@nttdata.com"

# Saves the parent entrypoint script.
RUN set -x && mv /docker-entrypoint.sh /elasticsearch-docker-entrypoint.sh

# Set entrypoint script.
COPY docker-entrypoint.sh /
RUN set -x && chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Run elasticsearch.
CMD ["elasticsearch"]
