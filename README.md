# php-fpm-ext

| Repository | Link |
|-------------|------|
| GitHub | https://github.com/tackleza/docker-php-fpm-ext |
| Docker Hub | https://hub.docker.com/r/tackleza/php-fpm-ext |

A PHP-FPM image with a curated set of common extensions pre-installed.

## ⚠️ This is NOT a standalone web server

This image **does not** include a web server. It only provides PHP-FPM. You must pair it with a frontend web server (Nginx, Caddy, Apache with mod_proxy_fcgi, etc.).

For a standalone PHP + Apache server, use **[tackleza/php-apache-ext](https://hub.docker.com/r/tackleza/php-apache-ext)** instead.

## Available Tags

| Tag | PHP Version | Base |
|-----|------------|------|
| `8.2-alpine` | PHP 8.2 | Alpine Linux |
| `8.3-alpine` | PHP 8.3 | Alpine Linux |
| `8.4-alpine` | PHP 8.4 | Alpine Linux |
| `8.5-alpine` | PHP 8.5 | Alpine Linux |
| `latest` | PHP 8.5 | Alpine Linux |

> PHP 8.6 / 9.0 are not yet available. PHP 8.1 has been dropped (EOL).

## Installed Extensions

| Extension | Description |
|-----------|-------------|
| `bcmath` | Arbitrary precision mathematics |
| `bz2` | Bzip2 compressed file support |
| `calendar` | Calendar conversion |
| `exif` | EXIF metadata in images |
| `gd` | Image creation and manipulation |
| `gettext` | Native language support (GNU gettext) |
| `gmp` | GNU Multiple Precision arithmetic |
| `imagick` | ImageMagick integration |
| `imap` | IMAP email protocol support |
| `intl` | Internationalization (ICU) |
| `mongod` | MongoDB driver |
| `mysqli` | MySQL Improved extension |
| `opcache` | PHP bytecode cache |
| `pcntl` | Process control |
| `pdo_mysql` | PDO MySQL driver |
| `shmop` | Shared memory operations |
| `soap` | SOAP protocol support |
| `sockets` | Low-level socket interface |
| `sysvmsg` | System V message queues |
| `sysvsem` | System V semaphores |
| `sysvshm` | System V shared memory |
| `tidy` | HTML/XML cleaner and repairer |
| `xsl` | XSLT transformations |
| `zip` | ZIP archive support |

## Installed System Tools

- **Composer** — PHP dependency manager
- **curl**, **git**, **nano**, **ping** — common CLI utilities

## Usage

### Quick start with Nginx

**1. Start the PHP-FPM container:**

```bash
docker run -d \
  --name php-fpm \
  -v $(pwd)/data:/var/www/html \
  tackleza/php-fpm-ext:8.3-alpine
```

**2. Add Nginx configuration:**

```nginx
server {
    listen 80;
    server_name example.com;
    root /var/www/html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass php-fpm:9000;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
```

### Docker Compose example

```yaml
services:
  nginx:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - ./data:/var/www/html
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - php

  php:
    image: tackleza/php-fpm-ext:8.3-alpine
    volumes:
      - ./data:/var/www/html
      - ./custom-php.ini:/usr/local/etc/php/conf.d/custom-php.ini
```

## Custom PHP Configuration

Mount your own `.ini` file to override or add PHP settings:

```bash
-v $(pwd)/custom-php.ini:/usr/local/etc/php/conf.d/custom-php.ini
```

Example `custom-php.ini`:

```ini
memory_limit = 512M
upload_max_filesize = 512M
post_max_size = 512M
```

## Non-Root Operation

- PHP-FPM runs as the `www-data` user.
- Document root `/var/www` is owned by `www-data:www-data`.
- Ensure your mounted volume/directory is writable by uid 33 (`www-data`).
- The container itself runs as a non-privileged user (www-data).

## PHP Version Lifecycle

| Version | Status | EOL Date |
|---------|--------|----------|
| PHP 8.1 | ❌ Dropped | Nov 2025 |
| PHP 8.2 | ✅ Active | Dec 2026 |
| PHP 8.3 | ✅ Active | Dec 2027 |
| PHP 8.4 | ✅ Active | Dec 2028 |
| PHP 8.5 | ✅ Active | Dec 2029 |
