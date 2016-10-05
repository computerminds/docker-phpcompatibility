FROM composer/composer:1.0.0

# Install coder
RUN composer global require 'wimg/php-compatibility:*'

# Add the coding standards to PHPCS.
RUN cp -r /composer/vendor/wimg/php-compatibility /composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/PHPCompatibility

# Make sure phpcs was installed correctly.
RUN composer global exec 'which phpcs'

# List the installed standards.
RUN composer global exec 'phpcs -i'

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh", "-p"]

CMD ["--report=checkstyle", "--report-file=report/checkstyle.xml", "."]
