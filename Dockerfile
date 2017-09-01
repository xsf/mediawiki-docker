# Docker image that extends the base with email packages.
FROM benhutchins/mediawiki:postgres
MAINTAINER XSF Editors <editor@xmpp.org>
RUN pear channel-update pear.php.net && pear upgrade --force PEAR && pear install mail net_smtp