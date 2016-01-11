FROM ubuntu:precise

MAINTAINER Philipp Bucher <bucher@navigate.de>

RUN apt-get update && apt-get install -y libfreetype6 php5-xdebug  libmcrypt4 libpng12-0 php5-common php5-cli curl git php5-tidy php5-mysql php5-mcrypt php5-gd apache2 libapache2-mod-php5 php5-xsl telnet nano  php-pear --no-install-recommends && rm -rf /var/lib/apt/lists/*
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN usermod -u 1000 www-data && a2enmod rewrite

EXPOSE 80

VOLUME /var/www

CMD /usr/sbin/apache2ctl -D FOREGROUND

WORKDIR /var/www