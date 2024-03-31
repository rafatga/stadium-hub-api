#!/bin/bash

docker run -it --rm -v ~/.ssh/:/root/.ssh/ \-v /etc -v logs:/var/log -v ${PWD}/:/var/www/html -w /var/www/html rafatg/deployerphp bash -c "dep deploy"
