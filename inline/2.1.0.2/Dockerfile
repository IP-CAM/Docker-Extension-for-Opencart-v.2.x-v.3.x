FROM timrod/php-apache:7.2

ENV OPENCART_VERSION 2.1.0.2
ENV WWW_PATH /var/www/html
ENV OPENCART_USERNAME admin
ENV OPENCART_PASSWORD admin
ENV OPENCART_EMAIL email@example.com
ENV OPENCART_HTTP_SERVER http://localhost/
ENV OPENCART_DB_DRIVER mysqli
ENV OPENCART_DB_HOSTNAME localhost
ENV OPENCART_DB_USERNAME root
ENV OPENCART_DB_PASSWORD pass
ENV OPENCART_DB_DATABASE opencart
ENV OPENCART_DB_PORT 3306
ENV OPENCART_DB_PREFIX oc_

RUN set -xe \
    && mv /var/www/html/index.php /var/www/html/phpinfo.php \
    && curl -o /tmp/opencart.zip -L https://github.com/opencart/opencart/archive/${OPENCART_VERSION}.zip \
    && unzip /tmp/opencart.zip -d /tmp/ \
    && rsync -avu /tmp/opencart-${OPENCART_VERSION}/upload/ ${WWW_PATH}/ \
    && touch ${WWW_PATH}/config.php \
    && touch ${WWW_PATH}/admin/config.php \
    && rm -rf /tmp/* ${WWW_PATH}/config-dist.php ${WWW_PATH}/admin/config-dist.php \
    && chmod -R 0777 ${WWW_PATH}

COPY entrypoint.sh /bin/
COPY wait_for_service.sh /bin/

RUN chmod +x /bin/entrypoint.sh
RUN chmod +x /bin/wait_for_service.sh

EXPOSE 80

CMD ["entrypoint.sh"]
