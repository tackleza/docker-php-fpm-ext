#!/bin/bash
docker pull php:8.5-fpm-alpine3.23
docker build -t tackleza/php-fpm-ext:8.5-alpine .
