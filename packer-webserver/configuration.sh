#! /usr/bin/bash
sudo dnf clean all
sudo dnf -y update

echo "--- configuration: PHP with PHP-FPM ---"
echo "--- installing apache and mod_ssl---"
echo "--- installing remirepo and EPEL---"
echo "--- installing php resources ---"
sudo dnf -y install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

sudo dnf -y install                \
    httpd httpd-tools mod_ssl       \
    firewalld                      \
    pwgen                          \
    git                            \
    python3-mysql                  \
    php{,-common,-fpm,-gd,-json,-mbstring,-mysqlnd,-opcache,-pdo,-xml}
