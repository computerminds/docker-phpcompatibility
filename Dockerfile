FROM composer/composer:1.0.0

# Install coder
RUN composer global require 'wimg/php-compatibility:*'

# Add the coding standards to PHPCS.
RUN ln -s /composer/vendor/wimg/php-compatibility /composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/PHPCompatibility

# Make sure phpcs was installed correctly.
RUN composer global exec 'which phpcs'

# List the installed standards.
RUN composer global exec 'phpcs -i'

# Set the entrypoint to use the Drupal standard.
ENTRYPOINT ["phpcs", "-p", "--standard=PHPCompatibility"]
