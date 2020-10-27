FROM composer/composer:1

# Display version information
RUN composer --version

# Install coder
RUN composer global require 'dealerdirect/phpcodesniffer-composer-installer:^0.4.3' 'wimg/php-compatibility:8.*'

# Make sure phpcs was installed correctly.
RUN composer global exec 'which phpcs'

# List the installed standards.
RUN composer global exec 'phpcs -i'

# List the configs.
RUN composer global exec 'phpcs --config-show'

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh", "-p"]

CMD ["--report=checkstyle", "--report-file=report/checkstyle.xml", "."]
