FROM composer/composer:1

# Install coder
RUN composer global require 'higidi/composer-phpcodesniffer-standards-plugin:*' 'wimg/php-compatibility:*'

# Make sure phpcs was installed correctly.
RUN composer global exec 'which phpcs'

# List the installed standards.
RUN composer global exec 'phpcs -i'

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh", "-p"]

CMD ["--report=checkstyle", "--report-file=report/checkstyle.xml", "."]
