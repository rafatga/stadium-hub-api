#!/bin/sh
set -e
set -u
set -o pipefail

command composer install

command php-fpm
