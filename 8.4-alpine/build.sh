#!/bin/bash
docker pull php:8.4-fpm-alpine
docker build -t tackleza/php-fpm-ext:8.4-alpine -f Dockerfile ../
