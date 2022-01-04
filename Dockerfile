# Docker image that extends the base with postgres and email packages.
FROM mediawiki:stable
MAINTAINER XSF Editors <editor@xmpp.org>
RUN set -x; \
		apt-get update \
    && apt-get install -y --no-install-recommends \
        libpq-dev \
    && docker-php-ext-install pgsql \
    && rm -rf /var/lib/apt/lists/*

RUN pear channel-update pear.php.net && pear upgrade --force PEAR && pear install mail net_smtp

ADD https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_37-016576e.tar.gz extensions/MobileFrontend.tar.gz
RUN tar xzf /var/www/html/extensions/MobileFrontend.tar.gz -C /var/www/html/extensions/
ADD https://extdist.wmflabs.org/dist/extensions/DarkMode-REL1_37-8adedfd.tar.gz extensions/DarkMode.tar.gz
RUN tar xzf /var/www/html/extensions/DarkMode.tar.gz -C /var/www/html/extensions/
