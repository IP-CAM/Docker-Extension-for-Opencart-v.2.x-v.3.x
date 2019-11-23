#!/bin/bash

if [[ -f "${WWW_PATH}/install/cli_install.php" ]]; then

  wait_for_service.sh ${OPENCART_DB_HOSTNAME} 3306

  php /var/www/html/install/cli_install.php install \
  --db_hostname ${OPENCART_DB_HOSTNAME} \
  --db_username ${OPENCART_DB_USERNAME} \
  --db_password ${OPENCART_DB_PASSWORD} \
  --db_database ${OPENCART_DB_DATABASE} \
  --db_driver ${OPENCART_DB_DRIVER} \
  --db_port ${OPENCART_DB_PORT} \
  --db_prefix ${OPENCART_DB_PREFIX} \
  --username ${OPENCART_USERNAME} \
  --password ${OPENCART_PASSWORD} \
  --email ${OPENCART_EMAIL} \
  --http_server ${OPENCART_HTTP_SERVER}

  rm -rf ${WWW_PATH}/install
  mv ${WWW_PATH}/.htaccess.txt /var/www/html/.htaccess

  chown -R ${APACHE_RUN_USER}:${APACHE_RUN_USER_ID} ${WWW_PATH}
fi

docker-init.sh