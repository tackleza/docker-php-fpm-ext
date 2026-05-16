#!/bin/sh
set -e

TARGET_UID="${FPM_UID:-$(stat -c '%u' /var/www)}"
TARGET_GID="${FPM_GID:-$(stat -c '%g' /var/www)}"
CURRENT_UID=$(id -u www-data 2>/dev/null || echo "0")

if [ "$TARGET_UID" != "0" ] && [ "$TARGET_UID" != "$CURRENT_UID" ]; then
    sed -i "s/^www-data:x:[0-9]*:[0-9]*:/www-data:x:${TARGET_UID}:${TARGET_GID}:/" /etc/passwd
    sed -i "s/^www-data:x:[0-9]*:/www-data:x:${TARGET_GID}:/" /etc/group
fi

exec php-fpm
