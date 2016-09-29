FROM composer/composer:1.0.0

# Install coder
RUN composer global require 'drupal/coder:8.2.*'

# Add the coding standards to PHPCS.
RUN composer global exec 'phpcs --config-set installed_paths /composer/vendor/drupal/coder/coder_sniffer'

# Make sure phpcs was installed correctly.
RUN composer global exec 'which phpcs'

# List the installed standards.
RUN composer global exec 'phpcs -i'

# Set the entrypoint to use the Drupal standard.
ENTRYPOINT ["phpcs", "-p", "--standard=Drupal", "--exclude=Drupal.WhiteSpace.OpenTagNewline"]
