FROM bitnami/php-fpm:7.4-prod

RUN cd /tmp && \
    curl -sSL https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz > ioncube_loaders_lin_x86-64.tar.gz && \
    tar -xf ioncube_loaders_lin_x86-64.tar.gz && \
    cp ioncube/ioncube_loader_lin_7.4.so /opt/bitnami/php/lib/php/extensions && \
    rm -rf ioncube && \
    cat /opt/bitnami/php/etc/php.ini > saved_php.ini && \
    echo "zend_extension = /opt/bitnami/php/lib/php/extensions/ioncube_loader_lin_7.4.so" > /opt/bitnami/php/etc/php.ini && \
    cat saved_php.ini >> /opt/bitnami/php/etc/php.ini
