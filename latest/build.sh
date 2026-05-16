#!/bin/bash
docker pull php:8.5-fpm-alpine
docker build -t tackleza/php-fpm-ext:latest -f Dockerfile ../
