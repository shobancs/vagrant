#!/usr/bin/env bash

# BEGIN ########################################################################
echo -e "-- ------------------ --\n"
echo -e "-- BEGIN BOOTSTRAPING --\n"
echo -e "-- ------------------ --\n"

# VARIABLES ####################################################################
echo -e "-- Setting global variables\n"
APACHE_CONFIG=/etc/apache2/apache2.conf
VIRTUAL_HOST=localhost
DOCUMENT_ROOT=/var/www/html

# BOX ##########################################################################
echo -e "-- Updating packages list\n"
apt-get update -y -qq

# APACHE #######################################################################
echo -e "-- Installing Apache web server\n"
apt-get install -y apache2

echo -e "-- Adding ServerName to Apache config\n"
grep -q "ServerName ${VIRTUAL_HOST}" "${APACHE_CONFIG}" || echo "ServerName ${VIRTUAL_HOST}" >> "${APACHE_CONFIG}"

echo -e "-- Allowing Apache override to all\n"
sed -i "s/AllowOverride None/AllowOverride All/g" ${APACHE_CONFIG}

echo -e "-- Updating vhost file\n"
cat > /etc/apache2/sites-enabled/000-default.conf <<EOF
<VirtualHost *:80>
    ServerName ${VIRTUAL_HOST}
    DocumentRoot ${DOCUMENT_ROOT}

    <Directory ${DOCUMENT_ROOT}>
        Options Indexes FollowSymlinks
        AllowOverride All
        Order allow,deny
        Allow from all
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/${VIRTUAL_HOST}-error.log
    CustomLog ${APACHE_LOG_DIR}/${VIRTUAL_HOST}-access.log combined
</VirtualHost>
EOF

echo -e "-- Restarting Apache web server\n"
service apache2 restart

# JAVA #########################################################################
echo -e "-- Installing JAVA packages\n"
apt install default-jdk

# JENKINS #########################################################################
echo -e "-- Including Jenkins packages\n"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins

# END ##########################################################################
echo -e "-- ---------------- --"
echo -e "-- END BOOTSTRAPING --"
echo -e "-- ---------------- --"
