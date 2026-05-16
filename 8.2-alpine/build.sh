#!/bin/bash
docker pull php:8.2-fpm-alpine
docker build -t tackleza/php-fpm-ext:8.2-alpine -f Dockerfile ../
